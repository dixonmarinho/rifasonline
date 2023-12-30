using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Integration.Pay.Helpers
{
    public static class QRCode
    {
        public static Bitmap GenQRCode(this string text, int width, int height)
        {
            try
            {
                byte[] bytes = Convert.FromBase64String(text);
                using (MemoryStream ms = new MemoryStream(bytes))
                {
                    var image = Image.FromStream(ms);
                    return (Bitmap)image;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
