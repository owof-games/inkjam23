using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

public class TestLounge : MonoBehaviour
{
    [SerializeField] StringEvent continueEvent;
    [SerializeField] TextAsset inkAssetEN;
    [SerializeField] TextAsset inkAssetIT;
    [SerializeField] InkAtomsStory inkAtomsStory;
    [SerializeField] StringReference language;

    public static TestLounge Instance;

    private void Awake()
    {
        Instance = this;
    }

    public void StartGame()
    {
        TextAsset inkAsset = language.Value switch
        {
            "EN" => inkAssetEN,
            "IT" => inkAssetIT,
            _ => throw new System.Exception($"unknown language {language.Value}")
        };
        inkAtomsStory.SetInkTextAsset(inkAsset);
        continueEvent.Raise(null);
    }
}
