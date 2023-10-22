using System.Collections;

using DG.Tweening;

using UnityEngine;
using UnityEngine.UI;

public class IngredientsScroll : MonoBehaviour
{
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup;
    [SerializeField] private RectTransform rectTransform;
    [SerializeField] private float heightOutOfBounds = -420;
    [SerializeField] private GameObject ingredientPrefab;

    public float Speed;

    public IEnumerator StartScroll(string[] names)
    {
        // move away
        rectTransform.offsetMin = new(0, 4000);
        rectTransform.offsetMax = new(0, 4000);

        // destroy all current children
        //Array to hold all child obj
        GameObject[] allChildren = new GameObject[transform.childCount];
        var i = 0;
        foreach (Transform child in transform)
        {
            allChildren[i] = child.gameObject;
            i += 1;
        }
        foreach (GameObject child in allChildren)
        {
            DestroyImmediate(child.gameObject);
        }

        // add new children
        foreach (var name in names)
        {
            var ingredientGO = Instantiate(ingredientPrefab, transform);
            var ingredient = ingredientGO.GetComponent<Ingredient>();
            ingredient.SetText(name);
        }

        // let layout be recomputed
        yield return null;

        // move to the actual top
        var h = verticalLayoutGroup.preferredHeight;
        rectTransform.offsetMin = new(0, h);
        rectTransform.offsetMax = new(0, h);

        // start animation
        DOTween.To(() => rectTransform.offsetMin.y,
            newValue =>
            {
                rectTransform.offsetMin = new(0, newValue);
                rectTransform.offsetMax = new(0, newValue);
            },
            heightOutOfBounds,
            Speed)
            .SetSpeedBased()
            .SetEase(Ease.Linear)
            .SetLoops(-1);
    }
}
