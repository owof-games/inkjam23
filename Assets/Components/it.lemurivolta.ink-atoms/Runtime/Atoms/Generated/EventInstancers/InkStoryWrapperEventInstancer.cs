using UnityEngine;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Instancer of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomEventInstancer&lt;LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/InkStoryWrapper Event Instancer")]
    public class InkStoryWrapperEventInstancer : AtomEventInstancer<LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperEvent> { }
}
