using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("Prayer")]
public partial class Prayer
{
    [Key]
    public int IdPrayer { get; set; }

    public int? Code { get; set; }

    public string Description { get; set; } = null!;

    [StringLength(50)]
    [Unicode(false)]
    public string? DescriptionShort { get; set; }

    [InverseProperty("IdPrayerNavigation")]
    public virtual ICollection<PsalterDetail> PsalterDetails { get; set; } = new List<PsalterDetail>();
}
