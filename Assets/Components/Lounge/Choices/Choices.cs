using System;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.UI;

public class Choices : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI[] texts;
    [SerializeField] private Button[] buttons;
    [SerializeField] private ChosenChoiceEvent choiceEvent;

    private string[] choices;
    private int page;

    public void SetChoices(string[] t)
    {
        choices = t;
        page = 0;
        UpdateChoices();
    }

    private void UpdateChoices()
    {
        var baseIdx = page * 2;
        texts[0].text = choices[baseIdx];
        texts[1].text = baseIdx + 1 < choices.Length ? choices[baseIdx + 1] : "";
        texts[2].text = choices.Length > 3 ? "=>" : baseIdx + 2 < choices.Length ? choices[baseIdx + 2] : "";
        for (var i = 0; i < 3; i++)
        {
            buttons[i].interactable = !string.IsNullOrEmpty(texts[i].text);
        }
    }

    public void OnChoice1() => OnChoice(page * 2);
    public void OnChoice2() => OnChoice(page * 2 + 1);
    public void OnChoice3()
    {
        if (choices.Length > 3)
        {
            page = (page + 1) % (int)Mathf.Ceil(choices.Length / 2.0f);
            UpdateChoices();
        }
        else
        {
            OnChoice(page * 2 + 2);
        }
    }

    private void OnChoice(int index)
    {
        choiceEvent.Raise(new()
        {
            ChoiceIndex = index,
            FlowName = null
        });
    }
}
