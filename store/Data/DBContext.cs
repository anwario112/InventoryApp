using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.IO;

namespace store.Data
{
    public class DBContext : DbContext
    {
        public DbSet<Connection> Connections { get; set; }
        public DbSet<ItemFile> ItemFile { get; set; }

        public DbSet<ItemUnit> ItemUnit { get; set; }
        public DbSet<ItemBarcode> ItemBarcode { get; set; }
        public DbSet<Rak> Raks { get; set; }
        public DbSet<Section> Sections { get; set; }
        public DbSet<ItemCard>ItemCards { get; set; }

       
        public DbSet<ItemArchive> ItemArchive { get; set; }
        public DbSet<User>User { get; set; }
        public DbSet<ExportedRak> ExportedRak { get; set; }
        public DbSet<ExportedSection> ExportedSection { get; set; }
        public DbSet<ExportedCard> ExportedCard { get; set; }
        public DbSet<ShoppingCard> ShoppingCard { get; set; }






        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string folderPath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            string dbPath = Path.Combine(folderPath, "AppDB.db");

            optionsBuilder.UseSqlite($"Data Source={dbPath}");

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ItemFile>()
                .HasIndex(i => i.ItemNum)
                .HasDatabaseName("IX_ItemFile_ItemNum");


            modelBuilder.Entity<ItemFile>()
                .HasIndex(i => i.ItemName)
                .HasDatabaseName("IX_ItemFile_ItemName");


            
            modelBuilder.Entity<ItemUnit>()
                .HasIndex(i => i.UnitDesc)
                .HasDatabaseName("IX_ItemUnit_UnitDesc");


         

            modelBuilder.Entity<ItemBarcode>()
                .HasIndex(i => i.Barcode)
                .HasDatabaseName("IX_ItemBarcode_Barcode");


            modelBuilder.Entity<ItemBarcode>()
                .HasIndex(i => i.ItemID)
                .HasDatabaseName("IX_ItemBarcode_ItemID");


          

            modelBuilder.Entity<Rak>()
                .HasIndex(i => i.RakName) 
                .HasDatabaseName("IX_Rak_RakName");




            modelBuilder.Entity<Section>()
                .HasIndex(i => i.SectionName)
                .HasDatabaseName("IX_Section_SectionName");


            modelBuilder.Entity<Section>()
                .HasIndex(i => i.RakID)
                .HasDatabaseName("IX_Section_RakID");



            modelBuilder.Entity<ItemCard>()
                .HasIndex(i => i.ScanningNum)
                .HasDatabaseName("IX_ItemCard_ScanningNum"); 


            

            modelBuilder.Entity<ItemCard>()
                .HasIndex(i => i.SectionID)
                .HasDatabaseName("IX_ItemCard_SectionID");

            modelBuilder.Entity<ExportedRak>()
              .HasIndex(r => r.ExportedRakName)
              .HasDatabaseName("IX_ExportedRak_ExportedRakName");



            modelBuilder.Entity<ExportedSection>()
                .HasIndex(s => s.ExportedSectionName)
                .HasDatabaseName("IX_ExportedSection_ExportedSectionName");



            modelBuilder.Entity<ExportedCard>()
                .HasIndex(c => c.ScanningNum)
                .HasDatabaseName("IX_ExportedCard_ScanningNum");



            modelBuilder.Entity<ExportedCard>()
                .HasIndex(c => c.SectionID)
                .HasDatabaseName("IX_ExportedCard_SectionID");


            modelBuilder.Entity<ShoppingCard>()
               .HasIndex(s => new { s.UserID, s.ItemID })
               .HasDatabaseName("IX_UserID_ItemID");




        }


       












    }
}
