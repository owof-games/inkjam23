using UnityEngine;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `InkStoryWrapperPair`. Inherits from `AtomEvent&lt;InkStoryWrapperPair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/InkStoryWrapperPair", fileName = "InkStoryWrapperPairEvent")]
    public sealed class InkStoryWrapperPairEvent : AtomEvent<InkStoryWrapperPair>
    {
    }
}
