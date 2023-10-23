using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Menu : MonoBehaviour
{
    [SerializeField] private Button button;
    [SerializeField] private UnityEvent startGame;

    public void OnStartClick()
    {
        button.enabled = false;
        startGame.Invoke();
    }
}
