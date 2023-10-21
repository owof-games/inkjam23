using UnityEngine;

public class AreaManager : MonoBehaviour
{
    [SerializeField] private LoungeManager loungeManager;
    [SerializeField] private KitchenManager kitchenManager;

    public void OnMoveToLoungeCommand()
    {
        loungeManager.gameObject.SetActive(true);
        kitchenManager.gameObject.SetActive(false);
    }

    public void OnMoveToKitchenCommand()
    {
        loungeManager.gameObject.SetActive(false);
        kitchenManager.gameObject.SetActive(true);
    }
}
