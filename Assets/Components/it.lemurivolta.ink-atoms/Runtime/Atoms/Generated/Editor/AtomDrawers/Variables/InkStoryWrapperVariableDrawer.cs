#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomDrawer&lt;InkStoryWrapperVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InkStoryWrapperVariable))]
    public class InkStoryWrapperVariableDrawer : VariableDrawer<InkStoryWrapperVariable> { }
}
#endif
