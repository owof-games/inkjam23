using UnityEngine;

public class PotAnimation : MonoBehaviour
{
    [SerializeField] private Animator animator;
    [SerializeField] private string[] triggers;

    public void PutIngredient()
    {
        animator.SetTrigger(triggers[Random.Range(0, triggers.Length - 1)]);
    }
}
