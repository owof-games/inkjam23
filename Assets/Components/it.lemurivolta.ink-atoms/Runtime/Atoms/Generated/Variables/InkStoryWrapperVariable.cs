using UnityEngine;
using System;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomVariable&lt;LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperPair, InkStoryWrapperEvent, InkStoryWrapperPairEvent, InkStoryWrapperInkStoryWrapperFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/InkStoryWrapper", fileName = "InkStoryWrapperVariable")]
    public sealed class InkStoryWrapperVariable : AtomVariable<LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperPair, InkStoryWrapperEvent, InkStoryWrapperPairEvent, InkStoryWrapperInkStoryWrapperFunction>
    {
        protected override bool ValueEquals(LemuRivolta.InkAtoms.InkStoryWrapper other)
        {
            throw new NotImplementedException();
        }
    }
}
