#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `InkStoryWrapperPair`. Inherits from `AtomEventEditor&lt;InkStoryWrapperPair, InkStoryWrapperPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(InkStoryWrapperPairEvent))]
    public sealed class InkStoryWrapperPairEventEditor : AtomEventEditor<InkStoryWrapperPair, InkStoryWrapperPairEvent> { }
}
#endif
