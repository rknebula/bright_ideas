using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace bright_ideas.Models
{
    public class Idea : BaseEntity
    {
        [Key]
        public int IdeaId { get; set; }
        public string Description { get; set; }

        public int UserId { get; set; }
        public User User { get; set; }
        public List<Join> Likes { get; set; }

        public Idea()
        {
            Likes = new List<Join>();
        }
    }
}