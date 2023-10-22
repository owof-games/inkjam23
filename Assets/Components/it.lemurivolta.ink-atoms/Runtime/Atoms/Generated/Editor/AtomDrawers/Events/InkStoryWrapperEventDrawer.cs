#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomDrawer&lt;InkStoryWrapperEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InkStoryWrapperEvent))]
    public class InkStoryWrapperEventDrawer : AtomDrawer<InkStoryWrapperEvent> { }
}
#endif
