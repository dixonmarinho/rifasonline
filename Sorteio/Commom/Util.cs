using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sorteio.Portal.Commom
{
    public static class Util
    {
        private const string WA_LINK = "https://api.whatsapp.com/send?phone={0}&text=Ola!%20Aqui%20e%20da%20VipPremios";
        public static string WhatsappLink(string number)
        {
            var str = "";
            if (number != null)
            {
                number = number.Replace("(", "").Replace(")", "").Replace(" ", "").Replace("-", "");
                number = "55" + number;
                str = WA_LINK.Replace("{0}", number);
            }
            return str;
        }
    }
}
