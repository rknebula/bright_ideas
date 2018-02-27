using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace bright_ideas.Models
{
    public class IdeaViewModel : BaseEntity
    {
        [Required(ErrorMessage = "Description is required.")]
        [MinLength(8, ErrorMessage = "Description must be at least eight characters.")]
        public string Description { get; set; }
    }
}