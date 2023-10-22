using System.Linq;

using Ink.Runtime;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class KitchenManager : MonoBehaviour
{
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private IngredientsScroll ingredientsScroll;

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
            continueEvent.Raise();
        }
        if (storyStep.Choices.Length > 0)
        {
            // if there are choices, we can only display kitchen choices and we start the ingredients scroll
            var r = new System.Random();
            var names = baseIngredientNames.Concat(dialogueIngredientNames).OrderBy(item => r.Next()).ToArray();
            //    .Select(name => new IngredientDescription {
            //        Name = 
            //})
            StartCoroutine(ingredientsScroll.StartScroll(names));
        }
    }

    private string[] baseIngredientNames;

    public void OnBaseIngredientsChanged(VariableValuePair variableValuePair)
    {
        var baseIngredients = variableValuePair.Item2.Value as InkList;
        baseIngredientNames = baseIngredients.Keys.Select(key => key.itemName).ToArray();
    }

    private string[] dialogueIngredientNames;

    public void OnDialogueIngredientsChanged(VariableValuePair variableValuePair)
    {
        var dialogueIngredients = variableValuePair.Item2.Value as InkList;
        dialogueIngredientNames = dialogueIngredients.Keys.Select(key => key.itemName).ToArray();

    }
}
