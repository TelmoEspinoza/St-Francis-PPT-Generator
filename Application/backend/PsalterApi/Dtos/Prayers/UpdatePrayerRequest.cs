using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PsalterApi.Dtos.Prayers
{
    public class UpdatePrayerRequest
    {
        [Required]
        public required int Code { get; set; }
        [Required]
        public string Description { get; set; } = null!;

        [Required, StringLength(50)]
        public string? DescriptionShort { get; set; }
    }
}