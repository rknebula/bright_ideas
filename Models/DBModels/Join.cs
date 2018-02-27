using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace bright_ideas.Models
{
    public class Join : BaseEntity
    {
        [Key]
        public int JoinId { get; set; }

        public int UserId { get; set; }
        public User User { get; set; }

        public int IdeaId { get; set; }
        public Idea Idea { get; set; }
    }
}