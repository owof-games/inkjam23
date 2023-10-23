using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

using Ink.Runtime;

using LemuRivolta.InkAtoms;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class KitchenManager : MonoBehaviour
{
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private IngredientsScroll ingredientsScroll;
    [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
    [SerializeField] private int minRightIngredients = 2;
    [SerializeField] private string chooseIngredientText;
    [SerializeField] private string explanationText;
    [SerializeField] private GameObject infoBoxRoot;
    [SerializeField] private TextMeshProUGUI infoBoxText;
    [SerializeField] private DogronReactions dogronReactions;
    [SerializeField] private PotAnimation potAnimation;

    private int numRightIngredients;
    private bool hasUsedChooseIngredientAbility;
    private bool hasDisplayedExplanationBox;

    private void OnEnable()
    {
        numRightIngredients = 0;
        hasUsedChooseIngredientAbility = false;
        hasDisplayedExplanationBox = false;
        chosenIngredients.Clear();
    }

    public void OnStoryStep(StoryStep storyStep)
    {
        StartCoroutine(OnStoryStepCoroutine(storyStep));
    }

    private IEnumerator OnStoryStepCoroutine(StoryStep storyStep)
    {
        yield return animationCoroutine;
        ingredientsScroll.gameObject.SetActive(true);
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
                    bool chooseIngredient = hasChooseIngredient && !hasUsedChooseIngredientAbility;
                    if (chooseIngredient)
                    {
                        infoBoxRoot.SetActive(true);
                        infoBoxText.text = chooseIngredientText;
                        hasUsedChooseIngredientAbility = true;
                    }
                    else if (!hasDisplayedExplanationBox)
                    {
                        infoBoxRoot.SetActive(true);
                        infoBoxText.text = explanationText.Replace("{X}", numIngredients.ToString());
                        hasDisplayedExplanationBox = true;
                    }
                    else
                    {
                        infoBoxRoot.SetActive(false);
                    }
                    var ingredients = dialogueIngredients
                        .Concat(chooseIngredient ? Array.Empty<InkListItem>() : baseIngredients)
                        .Where(i => !chosenIngredients.Contains(i.itemName))
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

    private List<string> chosenIngredients = new();

    private Coroutine animationCoroutine;

    public void OnIngredientNameClicked(string name)
    {
        Debug.Log("Got the ingredient " + name);
        chosenIngredients.Add(name);
        var isRight = dialogueIngredients.Any(di => di.itemName == name);
        Debug.Log($"is right? {isRight}");
        if (isRight)
        {
            numRightIngredients++;
            animationCoroutine = dogronReactions.RightIngredientChosen();
        }
        else
        {
            animationCoroutine = dogronReactions.WrongIngredientChosen();
        }
        ingredientsScroll.gameObject.SetActive(false);
        potAnimation.PutIngredient();
        Debug.Log($"by now you got {numRightIngredients} right");
    }

    private bool hasChooseIngredient;

    public void OnAbilitiesChanged(VariableValuePair pair)
    {
        var newValue = pair.Item2.Value as InkList;
        hasChooseIngredient = newValue.Keys.Any(key => key.itemName == "SceltaIngrediente");
    }

    public void OnAliveCharactersChanged(VariableValuePair pair)
    {
        var newValue = pair.Item2.Value as InkList;
        var aliveCharacters = newValue.Keys.Select(key => key.itemName).ToList();
        foreach (var partOfKitchen in GetComponentsInChildren<PartOfKitchenCharacter>())
        {
            partOfKitchen.SetVisibility(aliveCharacters.Contains(partOfKitchen.CharacterName));
        }
    }

    private int numIngredients;

    public void OnNumIngredientsChangedEvent(VariableValuePair pair)
    {
        numIngredients = (int)pair.Item2.Value;
    }
}
