using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("TypePrayer")]
public partial class TypePrayer
{
    [Key]
    public int IdTypePrayer { get; set; }

    public int? Code { get; set; }

    public string Description { get; set; } = null!;

    [InverseProperty("IdTypePrayerNavigation")]
    public virtual ICollection<PsalterDetail> PsalterDetails { get; set; } = new List<PsalterDetail>();
}
