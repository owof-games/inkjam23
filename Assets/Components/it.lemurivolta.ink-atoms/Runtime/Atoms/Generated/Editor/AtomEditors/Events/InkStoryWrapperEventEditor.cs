#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomEventEditor&lt;LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(InkStoryWrapperEvent))]
    public sealed class InkStoryWrapperEventEditor : AtomEventEditor<LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperEvent> { }
}
#endif
