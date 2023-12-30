using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Sorteio.Common
{
    public class APICoreCommon
    {
        public static string GetValueSetting(string settingName)
        {
            var builder = new ConfigurationBuilder()
                               .SetBasePath(Directory.GetCurrentDirectory())
                               .AddJsonFile("appsettings.json");

            var cfg = builder.Build();
            var _settingName = settingName;
#if DEBUG
            _settingName = _settingName + "_debug";
#endif

            return cfg[_settingName];
        }
    }
}
