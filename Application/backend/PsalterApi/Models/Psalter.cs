using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("Psalter")]
public partial class Psalter
{
    [Key]
    public int IdPsalter { get; set; }
    public int? Code { get; set; }
    [StringLength(50)]
    public string? Description { get; set; }
    public int IdTemplate { get; set; }
    [InverseProperty("IdPsalterNavigation")]
    public virtual ICollection<PsalterDetail> PsalterDetails { get; set; } = new List<PsalterDetail>();
    [InverseProperty("IdPsalterNavigation")]
    public virtual ICollection<Calendar> Calendars { get; set; } = new List<Calendar>();
    [ForeignKey("IdTemplate")]
    [InverseProperty("Psalters")]
    public virtual Template IdTemplateNavigation { get; set; } = null!;

}
