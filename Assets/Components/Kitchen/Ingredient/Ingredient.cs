using TMPro;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class Ingredient : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI textMeshPro;

    [SerializeField] private IntEvent ingredientValueClicked;

    [SerializeField] private StringEvent ingredientNameClicked;

    private IngredientDescription description;

    public void SetDescription(IngredientDescription description)
    {
        this.description = description;
        textMeshPro.text = description.Name;
    }

    public void OnClick()
    {
        ingredientNameClicked.Raise(description.InkListItem.itemName);
        ingredientValueClicked.Raise(description.Value);
    }
}
