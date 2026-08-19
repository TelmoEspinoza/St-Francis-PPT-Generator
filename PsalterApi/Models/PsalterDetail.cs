using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("PsalterDetail")]
public partial class PsalterDetail
{
    [Key]
    public int IdPsalterDetail { get; set; }
    public int IdPsalter { get; set; }
  
    public int IdTypePrayer { get; set; }
    public int IdPrayer { get; set; }
    public int DayInt { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string Description { get; set; } = null!;
    public int? Position { get; set; }

    [ForeignKey("IdTypePrayer")]
    [InverseProperty("PsalterDetails")]
    public virtual TypePrayer IdTypePrayerNavigation { get; set; } = null!;

    [ForeignKey("IdPrayer")]
    [InverseProperty("PsalterDetails")]
    public virtual Prayer IdPrayerNavigation { get; set; } = null!;

    [ForeignKey("IdPsalter")]
    [InverseProperty("PsalterDetails")]
    public virtual Psalter IdPsalterNavigation { get; set; } = null!;

}
