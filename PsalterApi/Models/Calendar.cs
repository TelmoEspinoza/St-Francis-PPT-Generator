using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PsalterApi.Models;

[Table("Calendar")]
public partial class Calendar
{
    [Key]
    public int IdCalendar { get; set; }
    public int IdOrdo { get; set; }
    public int IdPsalter { get; set; }
    public int Year { get; set; }
    public DateOnly? Date { get; set; }

    public int DayInt { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? Description { get; set; }

    [ForeignKey("IdOrdo")]
    [InverseProperty("Calendars")]
    public virtual Ordo IdOrdoNavigation { get; set; } = null!;

    [ForeignKey("IdPsalter")]
    [InverseProperty("Calendars")]
    public virtual Psalter IdPsalterNavigation { get; set; } = null!;
}
