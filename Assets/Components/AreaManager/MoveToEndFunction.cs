using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu]
public class MoveToEndFunction : ActionExternalFunction
{
    [SerializeField] private VoidEvent moveToEndEvent;

    public MoveToEndFunction() : base("moveToEnd") { }

    public override void Call(BaseExternalFunctionContext context)
    {
        moveToEndEvent.Raise();
    }
}