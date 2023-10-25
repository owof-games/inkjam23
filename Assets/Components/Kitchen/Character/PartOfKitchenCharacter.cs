using UnityEngine;
using UnityEngine.UI;

public class PartOfKitchenCharacter : MonoBehaviour
{
    [SerializeField] private string characterName;

    [SerializeField] private Image pot;

    [SerializeField] private Image myImage;

    public string CharacterName => characterName;

    public void SetVisibility(bool visible)
    {
        if (pot != null)
        {
            pot.enabled = visible;
        }
        myImage.enabled = visible;
    }
}
