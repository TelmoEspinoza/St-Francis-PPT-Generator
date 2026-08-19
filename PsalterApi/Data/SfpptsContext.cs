using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using PsalterApi.Models;

namespace PsalterApi.Data;

public partial class SfpptsContext : DbContext
{
    public SfpptsContext()
    {
    }

    public SfpptsContext(DbContextOptions<SfpptsContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Calendar> Calendars { get; set; }

    public virtual DbSet<Ordo> Ordos { get; set; }

    public virtual DbSet<Prayer> Prayers { get; set; }

    public virtual DbSet<Psalter> Psalters { get; set; }

    public virtual DbSet<PsalterDetail> PsalterDetails { get; set; }

    public virtual DbSet<Season> Seasons { get; set; }

    public virtual DbSet<Template> Templates { get; set; }

    public virtual DbSet<TypePrayer> TypePrayers { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Calendar>(entity =>
        {
            entity.HasKey(e => e.IdCalendar).HasName("PK__Calendar__E73EAABF254F0F87");

            entity.HasOne(d => d.IdOrdoNavigation).WithMany(p => p.Calendars)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Ordo");

            entity.HasOne(d => d. IdOrdoNavigation).WithMany(p => p.Calendars)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PsalterDetail");
        });

        modelBuilder.Entity<Ordo>(entity =>
        {
            entity.HasKey(e => e.IdOrdo).HasName("PK__Ordo__8C34C2C68F84AACA");

            entity.HasOne(d => d.IdSeasonNavigation).WithMany(p => p.Ordos)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Seasons");
        });

        modelBuilder.Entity<Prayer>(entity =>
        {
            entity.HasKey(e => e.IdPrayer).HasName("PK__Prayer__C24F43054A6ED86C");
        });

        modelBuilder.Entity<Psalter>(entity =>
        {
            entity.HasKey(e => e.IdPsalter).HasName("PK__Psalter__AB03665FF49ADE6B");
            entity.HasOne(d => d.IdTemplateNavigation).WithMany(p => p.Psalters)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Template");
        });

        modelBuilder.Entity<PsalterDetail>(entity =>
        {
            entity.HasKey(e => e.IdPsalterDetail).HasName("PK__PsalterD__3CDEBEC20A1C7956");

            entity.HasOne(d => d.IdPrayerNavigation).WithMany(p => p.PsalterDetails)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Prayer");

            entity.HasOne(d => d.IdTypePrayerNavigation).WithMany(p => p.PsalterDetails)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TypePrayer");

            entity.HasOne(d => d.IdPsalterNavigation).WithMany(p => p.PsalterDetails)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Psalter");

            
        });

        modelBuilder.Entity<Season>(entity =>
        {
            entity.HasKey(e => e.IdSeason).HasName("PK__Seasons__3F685799A307F171");
        });

        modelBuilder.Entity<Template>(entity =>
        {
            entity.HasKey(e => e.IdTemplate).HasName("PK__Template__9F3C3DBEBFF8827B");
        });

        modelBuilder.Entity<TypePrayer>(entity =>
        {
            entity.HasKey(e => e.IdTypePrayer).HasName("PK__TypePray__5A10E4BE089E8E73");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
