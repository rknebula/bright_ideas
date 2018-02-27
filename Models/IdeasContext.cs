using Microsoft.EntityFrameworkCore;

namespace bright_ideas.Models
{
    public class IdeasContext : DbContext
    {
        // base() calls the parent class' constructor passing the "options" parameter along
        public IdeasContext(DbContextOptions<IdeasContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Idea> Ideas { get; set; }
        public DbSet<Join> Joins { get; set; }
    }
}