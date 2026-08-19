using System.ComponentModel.DataAnnotations;

namespace PsalterApi.Dtos.Prayers
{
    public class CreatePrayerRequest
    {
        [Required]
        public required int Code { get; set; }
        [Required]
        public string Description { get; set; } = null!;
        [Required, StringLength(50)]
        public string? DescriptionShort { get; set; }
    }
}