using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu]
public class MoveToKitchenFunction : ActionExternalFunction
{
    [SerializeField] private VoidEvent moveToKitchenEvent;

    public MoveToKitchenFunction() : base("moveToKitchen") { }

    public override void Call(BaseExternalFunctionContext context)
    {
        moveToKitchenEvent.Raise();
    }
}
