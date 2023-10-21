using System.Collections;
using System.Collections.Generic;

using LemuRivolta.InkAtoms;

using UnityAtoms.BaseAtoms;

using UnityEngine;

[CreateAssetMenu]
public class MoveToLoungeFunction : ActionExternalFunction
{
    [SerializeField] private VoidEvent moveToLoungeEvent;

    public MoveToLoungeFunction() : base("moveToLounge") { }

    public override void Call(BaseExternalFunctionContext context)
    {
        moveToLoungeEvent.Raise();
    }
}