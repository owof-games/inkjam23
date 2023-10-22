using UnityEditor;
using UnityAtoms.Editor;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(InkStoryWrapperVariable))]
    public sealed class InkStoryWrapperVariableEditor : AtomVariableEditor<LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperPair> { }
}
