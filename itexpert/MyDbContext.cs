using Microsoft.EntityFrameworkCore;
using itexpert.Models;

namespace itexpert
{
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {

        }

        public DbSet<CodeValuePair> CodeValuePairs { get; set; }
    }
}
