using UnityEngine;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomEvent&lt;LemuRivolta.InkAtoms.InkStoryWrapper&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/InkStoryWrapper", fileName = "InkStoryWrapperEvent")]
    public sealed class InkStoryWrapperEvent : AtomEvent<LemuRivolta.InkAtoms.InkStoryWrapper>
    {
    }
}
