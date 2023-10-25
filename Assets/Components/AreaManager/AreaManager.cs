using System;
using System.Collections;

using DG.Tweening;

using UnityEngine;

public class AreaManager : MonoBehaviour
{
    [SerializeField] private LoungeManager loungeManager;
    [SerializeField] private KitchenManager kitchenManager;
    [SerializeField] private Menu menu;

    [SerializeField] private AudioClip chillMusic;
    [SerializeField] private AudioClip dangerMusic;
    [SerializeField] private AudioSource audioSource;

    [SerializeField] private bool skipMenu = false;

    public static AreaManager Instance;

    private void Start()
    {
        Instance = this;
        if (!skipMenu)
        {
            menu.gameObject.SetActive(true);
        }
        audioSource.clip = chillMusic;
        audioSource.Play();
    }

    public void StartGame()
    {
        OnMoveTo(rememberShowLounge, rememberIsEnd);
        // StartCoroutine(StartGameCoroutine());
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

    public enum AreaKind
    {
        Menu,
        Lounge,
        Kitchen,
        End
    }

    public AreaKind Area { get; private set; } = AreaKind.Menu;

    private bool firstTime = true;
    private bool rememberShowLounge, rememberIsEnd;

    private void OnMoveTo(bool showLounge, bool isEnd = false)
    {
        if (firstTime)
        {
            // we immediately start the story, and this triggers the animation
            // true solution: it's the menu that loads the story and starts the transition
            rememberShowLounge = showLounge;
            rememberIsEnd = isEnd;
            firstTime = false;
            return;
        }
        var prevArea = Area;
        Area = showLounge && isEnd ? AreaKind.End :
            showLounge ? AreaKind.Lounge : AreaKind.Kitchen;
        var newMusic = Area == AreaKind.Kitchen ? dangerMusic : chillMusic;

        if (audioSource.clip != newMusic)
        {
            StartCoroutine(FadeMusicTo(newMusic));
        }

        if (isEnd || (prevArea != Area))
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

    [SerializeField] private float fadeInOutDuration = 0.5f;

    private IEnumerator FadeMusicTo(AudioClip newMusic)
    {
        yield return audioSource.DOFade(0, fadeInOutDuration / 2).AsyncWaitForCompletion();
        audioSource.Stop();
        audioSource.clip = newMusic;
        audioSource.Play();
        yield return audioSource.DOFade(1, fadeInOutDuration / 2).AsyncWaitForCompletion();
    }

    private IEnumerator StartSwitch(bool showLounge, bool isEnd)
    {
        Loader.ShowLoader();
        yield return Loader.WaitForPhase(Loader.Phase.ShowFullVideo);
        menu.gameObject.SetActive(false);
        loungeManager.gameObject.SetActive(showLounge);
        loungeManager.SetIsEnd(isEnd);
        kitchenManager.gameObject.SetActive(!showLounge);
    }
}
