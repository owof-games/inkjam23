using System.Collections;

using UnityEngine;
using UnityEngine.UI;

public class DogronReactions : MonoBehaviour
{
    [SerializeField] private Sprite wrongIngredientDogron;
    [SerializeField] private Sprite rightIngredientDogron;
    [SerializeField] private Sprite neutralDogron;
    [SerializeField] private Image image;
    [SerializeField] private float duration;
    [SerializeField] private int numExpressions;

    private void Start()
    {
        image.sprite = neutralDogron;
    }

    public Coroutine RightIngredientChosen() =>
        LaunchCoroutine(ShowRightIngredientChosen());

    public Coroutine WrongIngredientChosen() =>
        LaunchCoroutine(ShowWrongIngredientChosen());

    private Coroutine LaunchCoroutine(IEnumerator enumerator)
    {
        StopAllCoroutines();
        return StartCoroutine(enumerator);
    }

    private IEnumerator ShowRightIngredientChosen()
    {
        return UseSprite(rightIngredientDogron);
    }

    private IEnumerator ShowWrongIngredientChosen()
    {
        return UseSprite(wrongIngredientDogron);
    }

    private IEnumerator UseSprite(Sprite sprite)
    {
        for (var i = 0; i < numExpressions; i++)
        {
            image.sprite = sprite;
            yield return new WaitForSeconds(duration / numExpressions / 2);
            image.sprite = neutralDogron;
            yield return new WaitForSeconds(duration / numExpressions / 2);
        }
    }
}
