
using System;

namespace LemuRivolta.InkAtoms
{
    [Serializable]
    public class InkStoryWrapper
    {
        private Ink.Runtime.Story story;

        public Ink.Runtime.Story Story => story;

        public InkStoryWrapper(Ink.Runtime.Story story)
        {
            this.story = story;
        }
    }
}
