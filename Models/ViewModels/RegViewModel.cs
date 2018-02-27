using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace bright_ideas.Models
{
    public class RegViewModel : BaseEntity
    {
        [Required(ErrorMessage = "Name is required.")]
        [MinLength(2, ErrorMessage = "Name must be at least two characters.")]
        [RegularExpression(@"^[a-zA-Z\s]*$", ErrorMessage = "Name must only contain alphabetical characters.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Alias is required.")]
        [MinLength(2, ErrorMessage = "Alias must be at least two characters.")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "Alias must only contain alphabetical characters.")]
        public string Alias { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Email must be in valid format.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [MinLength(8, ErrorMessage = "Password must be at least 8 characters.")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Compare("Password", ErrorMessage = "Passwords must match.")]
        public string PasswordConfirmation { get; set; }
    }
}