using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Integration.Pay.Model
{
    public class ResponseOrderView
    {
        public int Pedido { get; set; }
        public string QRCodeGUID { get; set; }
        public string QRCodeURL { get; set; }
        public string QRCodeURLGov { get; set; }
        public string xInfo { get; set; }
        public bool IsOK { get; set; }
    }

    public class ResponseOrder : ResponseOrderView
    {
        public Bitmap QRCodeBitMap { get; set; }
    }

}
