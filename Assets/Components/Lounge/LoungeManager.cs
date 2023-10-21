using System.Collections.Generic;
using System.Linq;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class LoungeManager : MonoBehaviour
{
    [SerializeField] private GameObject charactersRoot;
    [SerializeField] private GameObject backgroundSelection;
    [SerializeField] private GameObject backgroundTalk;

    [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
    [SerializeField] private StringEvent continueEvent;

    private StoryChoice[] lastCharacterChoices;

    public void OnStoryStepEvent(StoryStep storyStep)
    {
        lastCharacterChoices = storyStep.Choices;
        var characterChoices = (from choice in storyStep.Choices
                                where choice.Text.StartsWith("@")
                                select choice.Text[1..]).ToList();
        if (characterChoices.Count > 0)
        {
            // make a characters choice
            charactersRoot.SetActive(true);
            foreach (var contestant in GetContestants())
            {
                var selectable = characterChoices.Contains(contestant.ContestantName);
                contestant.SetEnabled(selectable);
            }
        }
    }

    private IEnumerable<Contestant> GetContestants()
    {
        foreach (Transform child in charactersRoot.transform)
        {
            yield return child.GetComponent<Contestant>();
        }
    }

    public void OnContestantClicked(string name)
    {
        var contestant = GetContestants().First(c => c.ContestantName == name);
        backgroundSelection.SetActive(false);
        charactersRoot.SetActive(false);
        backgroundTalk.SetActive(true);
        chosenChoiceEvent.Raise(new()
        {
            FlowName = null,
            ChoiceIndex = lastCharacterChoices.First(c => c.Text == $"@{name}").Index
        });
        continueEvent.Raise(null);
    }
}
