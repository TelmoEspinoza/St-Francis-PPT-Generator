using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("Ordo")]
public partial class Ordo
{
    [Key]
    public int IdOrdo { get; set; }
    public int IdSeason { get; set; }
    public int WeekOrdo { get; set; }
    public int WeekPsalter { get; set; }
    public int DayInt { get; set; }
    public int? Code { get; set; }
    [StringLength(50)]
    public string Description { get; set; } = null!;
    [InverseProperty("IdOrdoNavigation")]
    public virtual ICollection<Calendar> Calendars { get; set; } = new List<Calendar>();
    [ForeignKey("IdSeason")]
    [InverseProperty("Ordos")]
    public virtual Season IdSeasonNavigation { get; set; } = null!;
}
