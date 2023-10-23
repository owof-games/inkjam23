using System;
using System.Collections;

using UnityEngine;

public class AreaManager : MonoBehaviour
{
    [SerializeField] private LoungeManager loungeManager;
    [SerializeField] private KitchenManager kitchenManager;
    [SerializeField] private Menu menu;

    [SerializeField] private bool skipMenu = false;

    public static AreaManager Instance;

    private void Start()
    {
        Instance = this;
        if (!skipMenu)
        {
            menu.gameObject.SetActive(true);
        }
    }

    public void StartGame()
    {
        StartCoroutine(StartGameCoroutine());
    }

    private IEnumerator StartGameCoroutine()
    {
        // show loader and wait for the video to start
        Loader.ShowLoader();
        yield return Loader.WaitForPhase(Loader.Phase.ShowFullVideo);
        // hide menu behind
        menu.gameObject.SetActive(false);
    }

    public void OnMoveToLoungeCommand() => OnMoveTo(true);

    public void OnMoveToKitchenCommand() => OnMoveTo(false);

    public void OnMoveToEndCommand() => OnMoveTo(true, true);

    private void OnMoveTo(bool showLounge, bool isEnd = false)
    {
        if (isEnd || (loungeManager.gameObject.activeSelf != showLounge &&
            kitchenManager.gameObject.activeSelf == showLounge &&
            !menu.gameObject.activeSelf))
        {
            // we must switch to the new view and the menu is not active to cover up for the operations
            // (or we forced the thing)
            StartCoroutine(StartSwitch(showLounge, isEnd));
        }
        else
        {
            // either we are in an initial state, or the menu is covering for us
            loungeManager.gameObject.SetActive(showLounge);
            kitchenManager.gameObject.SetActive(!showLounge);
        }
    }

    public enum AreaKind
    {
        Lounge,
        Kitchen,
        End
    }

    public AreaKind Area { get; private set; }

    private IEnumerator StartSwitch(bool showLounge, bool isEnd)
    {
        Area = showLounge && isEnd ? AreaKind.End :
            showLounge ? AreaKind.Lounge : AreaKind.Kitchen;
        Loader.ShowLoader();
        yield return Loader.WaitForPhase(Loader.Phase.ShowFullVideo);
        loungeManager.gameObject.SetActive(showLounge);
        loungeManager.SetIsEnd(isEnd);
        kitchenManager.gameObject.SetActive(!showLounge);
    }
}
