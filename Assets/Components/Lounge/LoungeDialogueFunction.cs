using System.Linq;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu]
public class LoungeDialogueFunction : ActionExternalFunction
{
    [SerializeField] private StringEvent loungeDialogueStarted;

    public LoungeDialogueFunction() : base("loungeDialogue")
    {
    }

    public override void Call(BaseExternalFunctionContext context)
    {
        var character = context.Arguments[0] as Ink.Runtime.InkList;
        var characterName = character.Keys.First().itemName;
        loungeDialogueStarted.Raise(characterName);
    }
}
