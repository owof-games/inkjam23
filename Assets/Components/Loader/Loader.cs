using System;
using System.Collections;

using DG.Tweening;

using UnityEngine;
using UnityEngine.Video;

public class Loader : MonoBehaviour
{
    [SerializeField] private VideoPlayer player;
    [SerializeField] private float minDuration;
    [SerializeField] private float comeInAndOutDuration;
    [SerializeField] private RectTransform rectTransform;

    private static Loader loaderInstance = null;

    private void Start()
    {
        if (loaderInstance == null)
        {
            loaderInstance = this;
        }
        else
        {
            DestroyImmediate(gameObject);
        }
    }

    public enum Phase
    {
        Hidden,
        SlideIn,
        ShowFullVideo,
        SlideOut
    }

    private Phase phase = Phase.Hidden;

    public static void ShowLoader()
    {
        loaderInstance.phase = Phase.SlideIn;
        loaderInstance.StartCoroutine(loaderInstance.ShowLoaderInstance());
    }

    private IEnumerator ShowLoaderInstance()
    {
        // TODO: seems like it kills dotweens on ALL rect transforms, not just this one...
        //DOTween.KillAll(rectTransform);
        yield return DOTween.Sequence()
            .Insert(0, rectTransform.DOAnchorMin(new Vector2(0, 0), comeInAndOutDuration))
            .Insert(0, rectTransform.DOAnchorMax(new Vector2(1, 1), comeInAndOutDuration))
            .WaitForCompletion();
        phase = Phase.ShowFullVideo;
        player.Play();
        yield return new WaitForSeconds(minDuration);
        phase = Phase.SlideOut;
        yield return DOTween.Sequence()
            .Insert(0, rectTransform.DOAnchorMin(new Vector2(-1, 0), comeInAndOutDuration))
            .Insert(0, rectTransform.DOAnchorMax(new Vector2(0, 1), comeInAndOutDuration))
            .WaitForCompletion();
        player.Stop();
        phase = Phase.Hidden;
    }

    public static Coroutine WaitForPhase(Phase phase)
    {
        return loaderInstance.StartCoroutine(loaderInstance.WaitForPhaseCoroutine(phase));
    }

    private IEnumerator WaitForPhaseCoroutine(Phase phase)
    {
        while (this.phase != phase)
        {
            yield return null;
        }
    }
}
