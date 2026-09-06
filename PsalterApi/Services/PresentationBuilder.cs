using System.IO;
using System.Linq;
using ShapeCrawler;

namespace PsalterApi.Services
{
    public class PresentationBuilder : IPresentationBuilder
    {
        private const string BodyFont = "Arial Narrow";
        private const string LabelFont = "Century Gothic";
        private const string TagColor = "FFFF00";
        private const string SlideBackgroundColor = "000000";

        private const int BodyX = 30;
        private const int BodyY = 40;
        private const int BodyWidth = 900;
        private const int BodyHeight = 500;

        private const int LabelX = 354;
        private const int LabelY = 22;
        private const int LabelWidth = 567;
        private const int LabelHeight = 40;

        public byte[] Build()
        {
            using var presentation = new Presentation();
            var blankLayoutNumber = presentation.SlideMaster(1).LayoutSlides.First(l => l.Name == "Blank").Number;

            presentation.Slides.Add(blankLayoutNumber);
            AddCoverGoodByePlaceholders(presentation.Slides[0]);

            presentation.Slides.Add(blankLayoutNumber);
            AddCoverGoodByePlaceholders(presentation.Slides[1]);

            using var stream = new MemoryStream();
            presentation.Save(stream);
            return stream.ToArray();
        }

        private static void AddCoverGoodByePlaceholders(IUserSlide slide)
        {
            slide.Fill.SetColor(SlideBackgroundColor);

            slide.Shapes.AddTextBox(LabelX, LabelY, LabelWidth, LabelHeight, "Sidebar");
            var sidebar = slide.Shapes.Last<IShape>();
            sidebar.Name = "Sidebar";
            sidebar.SetFontName(LabelFont);
            sidebar.SetFontColor(TagColor);

            slide.Shapes.AddTextBox(BodyX, BodyY, BodyWidth, BodyHeight, "Main");
            var main = slide.Shapes.Last<IShape>();
            main.Name = "Main";
            main.SetFontName(BodyFont);
        }
    }
}
