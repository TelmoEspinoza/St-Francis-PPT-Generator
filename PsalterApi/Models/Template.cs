using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("Template")]
public partial class Template
{
    [Key]
    public int IdTemplate { get; set; }

    public int? Code { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string Description { get; set; } = null!;

    [InverseProperty("IdTemplateNavigation")]
    public virtual ICollection<Psalter> Psalters { get; set; } = new List<Psalter>();
}
