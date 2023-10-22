using System;
using UnityEngine;
using LemuRivolta.InkAtoms;
namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// IPair of type `&lt;LemuRivolta.InkAtoms.InkStoryWrapper&gt;`. Inherits from `IPair&lt;LemuRivolta.InkAtoms.InkStoryWrapper&gt;`.
    /// </summary>
    [Serializable]
    public struct InkStoryWrapperPair : IPair<LemuRivolta.InkAtoms.InkStoryWrapper>
    {
        public LemuRivolta.InkAtoms.InkStoryWrapper Item1 { get => _item1; set => _item1 = value; }
        public LemuRivolta.InkAtoms.InkStoryWrapper Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private LemuRivolta.InkAtoms.InkStoryWrapper _item1;
        [SerializeField]
        private LemuRivolta.InkAtoms.InkStoryWrapper _item2;

        public void Deconstruct(out LemuRivolta.InkAtoms.InkStoryWrapper item1, out LemuRivolta.InkAtoms.InkStoryWrapper item2) { item1 = Item1; item2 = Item2; }
    }
}