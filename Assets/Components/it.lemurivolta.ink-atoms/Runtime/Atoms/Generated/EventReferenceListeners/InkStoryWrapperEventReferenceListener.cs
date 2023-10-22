using UnityEngine;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference Listener of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomEventReferenceListener&lt;LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperEvent, InkStoryWrapperEventReference, InkStoryWrapperUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/InkStoryWrapper Event Reference Listener")]
    public sealed class InkStoryWrapperEventReferenceListener : AtomEventReferenceListener<
        LemuRivolta.InkAtoms.InkStoryWrapper,
        InkStoryWrapperEvent,
        InkStoryWrapperEventReference,
        InkStoryWrapperUnityEvent>
    { }
}
