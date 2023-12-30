using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sorteio.Common
{
    public static class Extend
    {
        public static string FormatPhoneNumber(this long number)
        {
            return number.ToString(@"(00) 00000-0000");
        }

        public static string FormatPhoneNumber(this string number)
        {
            number = number.Replace("(", "").Replace(")", "").Replace("-", "");
            return long.Parse(number).FormatPhoneNumber();
        }
    }
}
