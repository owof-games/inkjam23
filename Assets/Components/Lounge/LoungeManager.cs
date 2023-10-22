using System.Collections.Generic;
using System.Linq;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class LoungeManager : MonoBehaviour
{
    [SerializeField] private string youName = "YOU";

    [SerializeField] private GameObject contestantSelection;
    [SerializeField] private GameObject contestantSelectionRoot;
    [SerializeField] private GameObject characterTalk;
    [SerializeField] private GameObject charactersTalkingRoot;
    [SerializeField] private Balloon leftBalloon;
    [SerializeField] private Balloon rightBalloon;
    [SerializeField] private Choices choices;

    [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
    [SerializeField] private StringEvent continueEvent;

    private StoryChoice[] lastCharacterChoices;
    private bool waitingForNextLine;

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
            return;
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
            var activeBalloon = character == youName ? leftBalloon : rightBalloon;
            var nonActiveBalloon = character == youName ? rightBalloon : leftBalloon;
            activeBalloon.gameObject.SetActive(true);
            activeBalloon.Write(text);
            activeBalloon.EnableAdvanceButton(storyStep.CanContinue);
            nonActiveBalloon.gameObject.SetActive(false);
        }
        waitingForNextLine = storyStep.CanContinue;

        // check if there are choices
        bool hasChoices = storyStep.Choices.Length > 0;
        choices.gameObject.SetActive(hasChoices);
        if (hasChoices)
        {
            choices.SetChoices(storyStep.Choices.Select(c => GetTalkingData(c.Text).text).ToArray());
        }
    }

    private void Update()
    {
        if (waitingForNextLine && (Input.GetKeyDown(KeyCode.Space) || Input.GetKeyDown(KeyCode.Return)))
        {
            continueEvent.Raise(null);
        }
    }

    private (string character, string text) GetTalkingData(string source)
    {
        var pieces = source.Split(':', 2);
        if (pieces.Length < 2)
        {
            return (null, source.Trim());
        }
        var characterName = pieces[0];
        if (characterName == youName)
        {
            return (characterName.Trim(), pieces[1].Trim());
        }
        foreach (var characterTalking in GetCharactersTalking())
        {
            if (characterTalking.CharacterName == characterName)
            {
                return (characterName.Trim(), pieces[1].Trim());
            }
        }
        return (null, source.Trim());
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
    }
}
