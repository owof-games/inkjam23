using System;
using System.Collections.Generic;
using System.Linq;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class LoungeManager : MonoBehaviour
{
    [SerializeField] private GameObject contestantSelection;
    [SerializeField] private GameObject contestantSelectionRoot;
    [SerializeField] private GameObject characterTalk;
    [SerializeField] private GameObject charactersTalkingRoot;

    [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
    [SerializeField] private StringEvent continueEvent;

    private StoryChoice[] lastCharacterChoices;

    public void OnStoryStepEvent(StoryStep storyStep)
    {
        // check if we have a characters' choice
        lastCharacterChoices = storyStep.Choices;
        var characterChoices = (from choice in storyStep.Choices
                                where choice.Text.StartsWith("@")
                                select choice.Text[1..]).ToList();
        if (characterChoices.Count > 0)
        {
            // make a characters choice
            SetRoomStyle(true);
            foreach (var contestant in GetContestantsInSelection())
            {
                var selectable = characterChoices.Contains(contestant.ContestantName);
                contestant.SetEnabled(selectable);
            }
        }

        // check if a character is talking
        var (character, text) = GetTalkingData(storyStep.Text);
        if (character != null)
        {
            SetRoomStyle(false);
            foreach (var characterTalking in GetCharactersTalking())
            {
                characterTalking.gameObject.SetActive(characterTalking.CharacterName == character);
            }
        }
    }

    private (string character, string text) GetTalkingData(string source)
    {
        var pieces = source.Trim().Split(':', 2);
        if (pieces.Length < 2)
        {
            return (null, source);
        }
        var characterName = pieces[0];
        if (characterName == "you")
        {
            return (characterName, pieces[1]);
        }
        foreach (var characterTalking in GetCharactersTalking())
        {
            if (characterTalking.CharacterName == characterName)
            {
                return (characterName, pieces[1]);
            }
        }
        return (null, source);
    }

    private void SetRoomStyle(bool showCharacterSelection)
    {
        contestantSelection.SetActive(showCharacterSelection);
        characterTalk.SetActive(!showCharacterSelection);
    }

    private IEnumerable<ContestantInSelection> GetContestantsInSelection()
    {
        foreach (Transform child in contestantSelectionRoot.transform)
        {
            yield return child.GetComponent<ContestantInSelection>();
        }
    }

    private IEnumerable<CharacterTalking> GetCharactersTalking()
    {
        foreach (Transform child in charactersTalkingRoot.transform)
        {
            yield return child.GetComponent<CharacterTalking>();
        }
    }

    public void OnContestantClicked(string name)
    {
        var contestant = GetContestantsInSelection().First(c => c.ContestantName == name);
        chosenChoiceEvent.Raise(new()
        {
            FlowName = null,
            ChoiceIndex = lastCharacterChoices.First(c => c.Text == $"@{name}").Index
        });
        continueEvent.Raise(null);
    }
}
