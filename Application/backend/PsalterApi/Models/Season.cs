using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

public partial class Season
{
    [Key]
    public int IdSeason { get; set; }
    public int? Code { get; set; }
    [StringLength(50)]
    [Unicode(false)]
    public string Description { get; set; } = null!;
    [InverseProperty("IdSeasonNavigation")]
    public virtual ICollection<Ordo> Ordos { get; set; } = new List<Ordo>();
}
