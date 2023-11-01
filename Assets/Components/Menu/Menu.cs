using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Menu : MonoBehaviour
{
    [SerializeField] private Button button;
    [SerializeField] private UnityEvent startGame;
    [SerializeField] private StringVariable language;

    public void OnStartClick()
    {
        button.enabled = false;
        TestLounge.Instance.StartGame();
        startGame.Invoke();
    }

    public void OnENToggleChanged(bool @checked)
    {
        if (@checked)
        {
            language.Value = "EN";
        }
    }

    public void OnITToggleChanged(bool @checked)
    {
        if (@checked)
        {
            language.Value = "IT";
        }
    }
}
