using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

using DG.Tweening;

using Ink.Runtime;

using UnityAtoms.BaseAtoms;

using UnityEngine;
using UnityEngine.UI;

public class IngredientsScroll : MonoBehaviour
{
    [SerializeField] private VerticalLayoutGroup verticalLayoutGroup;
    [SerializeField] private RectTransform rectTransform;
    [SerializeField] private float heightOutOfBounds = -420;
    [SerializeField] private GameObject ingredientPrefab;

    [SerializeField] public float speed = 350;
    [SerializeField] public float slowChoicesRate = 0.5f;
    [SerializeField] public float slowChoicesFadeIn = 1f;

    private List<IngredientDescription> previousDescriptions;

    private readonly Comparison<IngredientDescription> ic = new(CompareIngredients);

    private static int CompareIngredients(IngredientDescription x, IngredientDescription y)
    {
        return x.Name.CompareTo(y.Name);
    }

    private void OnDisable()
    {
        previousDescriptions = null;
    }

    public IEnumerator StartScroll(IngredientDescription[] ingredientDescriptions)
    {
        var newDescriptions = new List<IngredientDescription>(ingredientDescriptions);
        newDescriptions.Sort(ic);
        if (previousDescriptions != null && Enumerable.SequenceEqual(previousDescriptions, newDescriptions))
        {
            yield break;
        }
        previousDescriptions = newDescriptions;

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
        foreach (var description in ingredientDescriptions)
        {
            var ingredientGO = Instantiate(ingredientPrefab, transform);
            var ingredient = ingredientGO.GetComponent<Ingredient>();
            ingredient.SetDescription(description);
        }

        // let layout be recomputed
        Canvas.ForceUpdateCanvases();
        //yield return null;

        // move to the actual top
        var h = verticalLayoutGroup.preferredHeight;
        rectTransform.offsetMin = new(0, h);
        rectTransform.offsetMax = new(0, h);

        // start animation
        var tween = DOTween.To(() => rectTransform.offsetMin.y,
            newValue =>
            {
                rectTransform.offsetMin = new(0, newValue);
                rectTransform.offsetMax = new(0, newValue);
            },
            heightOutOfBounds,
            speed)
            .From(h)
            .SetSpeedBased()
            .SetEase(Ease.Linear)
            .SetLoops(-1)
            .SetTarget(rectTransform)
            .SetLink(gameObject, LinkBehaviour.KillOnDisable);
        if (hasSlowChoices)
        {
            tween.DOTimeScale(slowChoicesRate, slowChoicesFadeIn)
                .SetEase(Ease.Linear)
                .SetLink(gameObject, LinkBehaviour.KillOnDisable);
        }
    }

    private bool hasSlowChoices;

    public void OnAbilitiesChanged(VariableValuePair pair)
    {
        var newValue = pair.Item2.Value as InkList;
        hasSlowChoices = newValue.Keys.Any(key => key.itemName == "ScelteLente");
    }

}
