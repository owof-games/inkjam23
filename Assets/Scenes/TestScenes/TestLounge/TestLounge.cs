using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class TestLounge : MonoBehaviour
{
    [SerializeField] StringEvent continueEvent;
    [SerializeField] TextAsset inkAsset;
    [SerializeField] InkAtomsStory inkAtomsStory;

    private void Start()
    {
        inkAtomsStory.SetInkTextAsset(inkAsset);
        continueEvent.Raise(null);
    }
}
