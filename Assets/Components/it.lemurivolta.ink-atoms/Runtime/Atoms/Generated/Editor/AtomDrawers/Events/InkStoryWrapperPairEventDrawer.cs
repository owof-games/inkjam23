#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `InkStoryWrapperPair`. Inherits from `AtomDrawer&lt;InkStoryWrapperPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InkStoryWrapperPairEvent))]
    public class InkStoryWrapperPairEventDrawer : AtomDrawer<InkStoryWrapperPairEvent> { }
}
#endif
