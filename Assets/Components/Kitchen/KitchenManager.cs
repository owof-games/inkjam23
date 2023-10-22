using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class KitchenManager : MonoBehaviour
{
    [SerializeField] private StringEvent continueEvent;

    public void OnStoryStep(StoryStep storyStep)
    {
        if(!string.IsNullOrEmpty(storyStep.Text))
        {
            // just print it
            Debug.Log(storyStep.Text, this);
        }
        if(storyStep.CanContinue)
        {
            // if there's debug text, just continue
            continueEvent.Raise();
        }
        if(storyStep.Choices.Length > 0)
        {
            // if there are choices, we can only display kitchen choices
        }
    }
}
