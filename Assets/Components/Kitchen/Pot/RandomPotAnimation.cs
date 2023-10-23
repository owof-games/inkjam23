using System.Collections;

using UnityEngine;

public class RandomPotAnimation : MonoBehaviour
{
    [SerializeField] private PotAnimation potAnimation;
    [SerializeField] private float minWaitBetweenAnimations = 0.5f;
    [SerializeField] private float maxWaitBetweenAnimations = 2;

    private void Start()
    {
          StartCoroutine(RandomAnimations());
    }

    private IEnumerator RandomAnimations()
    {
        for (; ; )
        {
            yield return new WaitForSeconds(Random.Range(minWaitBetweenAnimations, maxWaitBetweenAnimations));
            potAnimation.PutIngredient();
        }
    }
}
