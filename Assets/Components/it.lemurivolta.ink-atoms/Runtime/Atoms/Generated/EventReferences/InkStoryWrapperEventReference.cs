using System;
using LemuRivolta.InkAtoms;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference of type `LemuRivolta.InkAtoms.InkStoryWrapper`. Inherits from `AtomEventReference&lt;LemuRivolta.InkAtoms.InkStoryWrapper, InkStoryWrapperVariable, InkStoryWrapperEvent, InkStoryWrapperVariableInstancer, InkStoryWrapperEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class InkStoryWrapperEventReference : AtomEventReference<
        LemuRivolta.InkAtoms.InkStoryWrapper,
        InkStoryWrapperVariable,
        InkStoryWrapperEvent,
        InkStoryWrapperVariableInstancer,
        InkStoryWrapperEventInstancer>, IGetEvent 
    { }
}
