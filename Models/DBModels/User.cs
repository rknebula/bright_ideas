using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace bright_ideas.Models
{
    public class User : BaseEntity
    {
        [Key]
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Alias { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public List<Idea> Ideas { get; set; }
        public List<Join> Likes { get; set; }

        public User()
        {
            Likes = new List<Join>();
        }
    }
}