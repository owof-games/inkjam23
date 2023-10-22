using System.Linq;

using Ink.Runtime;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class KitchenManager : MonoBehaviour
{
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private IngredientsScroll ingredientsScroll;
    [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
    [SerializeField] private int minRightIngredients = 2;

    private int numRightIngredients;

    private void OnEnable()
    {
        numRightIngredients = 0;
    }

    public void OnStoryStep(StoryStep storyStep)
    {
        if (!string.IsNullOrEmpty(storyStep.Text))
        {
            // just print it
            Debug.Log(storyStep.Text, this);
        }
        if (storyStep.CanContinue)
        {
            // if there's debug text, just continue
            Debug.Log("Continuing story in kitchen");
            continueEvent.Raise(null);
        }
        if (storyStep.Choices.Length > 0)
        {
            StoryChoice doneStoryChoice = storyStep.Choices.FirstOrDefault(choice => choice.Text == "done");
            if (doneStoryChoice.Text == "done")
            {
                Debug.Log("EXIT KITCHEN");
                bool hasSuccess = numRightIngredients >= minRightIngredients;
                Debug.Log($"the recipe was a success? {hasSuccess}");
                InkAtomsStory.lastStory.variablesState["success"] = hasSuccess;
                chosenChoiceEvent.Raise(new()
                {
                    FlowName = null,
                    ChoiceIndex = doneStoryChoice.Index
                });
            }
            else
            {
                Debug.Log("Setting up scroll");
                // if there are value choices, we start the ingredients scroll
                InkAtomsStory.disableEventPropagation = true;
                try
                {
                    var r = new System.Random();
                    var ingredients = baseIngredients.Concat(dialogueIngredients)
                        .OrderBy(item => r.Next())
                        .Select(i =>
                        {
                            var il = new InkList("ingredients", InkAtomsStory.lastStory);
                            il.AddItem(i);
                            InkAtomsStory.lastStory.EvaluateFunction("translate_ingredient", out var name, il);
                            InkAtomsStory.lastStory.EvaluateFunction("value_ingredient", out var value, il);
                            return new IngredientDescription
                            {
                                Name = name.Trim(),
                                Value = int.Parse(value.Trim()),
                                InkListItem = i
                            };
                        })
                        .ToArray();
                    StartCoroutine(ingredientsScroll.StartScroll(ingredients));
                }
                finally
                {
                    InkAtomsStory.disableEventPropagation = false;
                }
            }
        }
    }

    private InkListItem[] baseIngredients;

    public void OnBaseIngredientsChanged(VariableValuePair variableValuePair)
    {
        baseIngredients = (variableValuePair.Item2.Value as InkList)
            .Keys.ToArray();
    }

    private InkListItem[] dialogueIngredients;

    public void OnDialogueIngredientsChanged(VariableValuePair variableValuePair)
    {
        dialogueIngredients = (variableValuePair.Item2.Value as InkList)
            .Keys.ToArray();
    }

    private Story story;
    public void OnInkStoryWrapperEvent(InkStoryWrapper inkStoryWrapper)
    {
        story = inkStoryWrapper.Story;
    }

    public void OnIngredientValueClicked(int value)
    {
        Debug.Log($"Adding ingredient with value {value}");
        chosenChoiceEvent.Raise(new()
        {
            FlowName = null,
            ChoiceIndex = value - 1 // 0 is the first choice, 1 the second...
        });
    }

    public void OnIngredientNameClicked(string name)
    {
        Debug.Log("Got the ingredient " + name);
        var isRight = dialogueIngredients.Any(di => di.itemName == name);
        Debug.Log($"is right? {isRight}");
        if (isRight) { numRightIngredients++; }
        Debug.Log($"by now you got {numRightIngredients} right");
    }
}
