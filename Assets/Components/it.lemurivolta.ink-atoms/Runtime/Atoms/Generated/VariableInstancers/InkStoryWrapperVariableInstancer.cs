using UnityEngine;
using UnityAtoms.BaseAtoms;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable Instancer of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomVariableInstancer&lt;InkStoryWrapperVariable, InkStoryWrapperPair, LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperEvent, InkStoryWrapperPairEvent, InkStoryWrapperInkStoryWrapperFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/InkStoryWrapper Variable Instancer")]
    public class InkStoryWrapperVariableInstancer : AtomVariableInstancer<
        InkStoryWrapperVariable,
        InkStoryWrapperPair,
        LemuRivolta.InkAtoms.InkStoryWrapper,
        InkStoryWrapperEvent,
        InkStoryWrapperPairEvent,
        InkStoryWrapperInkStoryWrapperFunction>
    { }
}
