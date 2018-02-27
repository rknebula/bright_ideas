using System.ComponentModel.DataAnnotations;
namespace bright_ideas.Models
{
    public class LogViewModel : BaseEntity
    {
        [Required(ErrorMessage = "Email field must not be empty.")]
        [EmailAddress]
        public string LogEmail { get; set; }

        [Required(ErrorMessage = "Password field must not be empty.")]
        [DataType(DataType.Password)]
        public string LogPassword { get; set; }
    }
}