using System.Collections.Generic;
using System.Data.Entity;
using ClickNBuy.Models;

namespace ClickNBuy.Data
{
    public class ApplicationDbContext : DbContext
    {
        internal IEnumerable<object> tbl_admin;
        internal IEnumerable<object> tbl_category;

        public ApplicationDbContext() : base("DefaultConnection")
        {
        }

        public DbSet<Cart> Carts { get; set; }
        public DbSet<Wishlist> Wishlists { get; set; }
        public DbSet<tbl_admin> admins { get; set; }
        public DbSet<tbl_category> categories { get; set; }


        // لا تضف الـ ViewModels هنا لأنها ليست جداول في قاعدة البيانات
    }
}
