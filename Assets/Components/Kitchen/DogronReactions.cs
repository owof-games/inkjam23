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

    private void Start()
    {
        image.sprite = neutralDogron;
    }

    public void RightIngredientChosen()
    {
        LaunchCoroutine(ShowRightIngredientChosen());
    }

    public void WrongIngredientChosen()
    {
        LaunchCoroutine(ShowWrongIngredientChosen());
    }

    private void LaunchCoroutine(IEnumerator enumerator)
    {
        StopAllCoroutines();
        StartCoroutine(enumerator);
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
        image.sprite = sprite;
        yield return new WaitForSeconds(duration);
        image.sprite = neutralDogron;
    }
}
