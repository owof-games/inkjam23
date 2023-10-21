using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.UI;

public class Contestant : MonoBehaviour
{
    [SerializeField] private string contestantName;

    [SerializeField] private StringEvent contestantClicked;

    public string ContestantName => contestantName;

    private void OnEnable()
    {
        GetComponent<Button>().onClick.AddListener(OnButtonClick);
    }

    private void OnDisable()
    {
        GetComponent<Button>().onClick.RemoveListener(OnButtonClick);
    }

    private void OnButtonClick()
    {
        contestantClicked.Raise(ContestantName);
    }

    public void SetEnabled(bool enabled)
    {
        GetComponent<Button>().interactable = enabled;
    }
}
