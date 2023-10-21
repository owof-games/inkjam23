using System;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class Choices : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI[] texts;
    [SerializeField] private ChosenChoiceEvent choiceEvent;

    public void SetChoices(string[] t)
    {
        for (var i = 0; i < t.Length; i++)
        {
            texts[i].text = t[i];
        }
    }

    public void OnChoice1() => OnChoice(0);
    public void OnChoice2() => OnChoice(1);
    public void OnChoice3() => OnChoice(2);

    private void OnChoice(int index)
    {
        choiceEvent.Raise(new()
        {
            ChoiceIndex = index,
            FlowName = null
        });
    }
}
