using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sorteio.Test
{
    public class BaseTest
    {
        public IWebHost webHost { get; private set; }
        public BaseTest()
        {
            var startup = Microsoft.AspNetCore.WebHost.CreateDefaultBuilder().UseStartup<Startup>();
            webHost = startup.Build();

        }
    }
}
