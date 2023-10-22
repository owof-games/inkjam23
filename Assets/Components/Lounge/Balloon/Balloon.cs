using LemuRivolta.InkAtoms;

using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.UI;

public class Balloon : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI textMeshProUGUI;
    [SerializeField] private StringEvent continueEvent;
    [SerializeField] private Button advanceButton;
    [SerializeField] private GameObject cover;

    public void Write(string text)
    {
        textMeshProUGUI.text = text;
    }

    public void EnableAdvanceButton(bool enable)
    {
        advanceButton.gameObject.SetActive(enable);
        cover.SetActive(!enable);
    }

    public void OnAdvance()
    {
        continueEvent.Raise(null);
    }
}
