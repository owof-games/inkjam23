using UnityAtoms.BaseAtoms;

using UnityEngine;

public class TestLounge : MonoBehaviour
{
    [SerializeField] StringEvent continueEvent;

    private void Start()
    {
        continueEvent.Raise(null);
    }
}
