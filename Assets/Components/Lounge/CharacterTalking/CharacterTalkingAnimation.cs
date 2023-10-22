using UnityEngine;
using UnityEngine.UI;

public class CharacterTalkingAnimation : MonoBehaviour
{
    [SerializeField] private Image image;
    [SerializeField] private Sprite[] sprites;

    public void ChangeSpriteAtRandom()
    {
        var currSprite = image.sprite;
        while (image.sprite == currSprite)
        {
            image.sprite = sprites[Random.Range(0, sprites.Length - 1)];
        }
    }
}
