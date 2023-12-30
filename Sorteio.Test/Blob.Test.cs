using Azure.Storage.Blobs;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Sorteio.Test
{
    public class Blob
    {
        [Fact]
        public void Salvar()
        {
            var filename = @"D:\Docs\Media\Fotos\foto_dixon.jpg";
            var name = Guid.NewGuid().ToString() + "png";
            //var blobClient = new BlobClient("DefaultEndpointsProtocol=https;AccountName=vmsperfdiag756;AccountKey=xdLjShIgX28o6loK45RF9d0jlpx8xKzLHJVBAq3vgjWNewqGk9mIcLh5iCHimaKjlVkKmpbr7q31gmamGLFJvw==;EndpointSuffix=core.windows.net",
            //                                "imagens", fileName);
            var blobClient = new BlobClient("DefaultEndpointsProtocol=https://impersoft.blob.core.windows.net/vippremios?sp=racwd&st=2021-10-11T11:34:38Z&se=2030-10-11T19:34:38Z&sv=2020-08-04&sr=c&sig=c%2FujW4aJ6aX6A2jSHNQFFD8n1ie7F7DDwEsRo7YoVYo%3D",
                                            "vippremios", name);

            using (MemoryStream stream = new MemoryStream())
            {
                using (FileStream file = new FileStream(filename, FileMode.Open, FileAccess.Read))
                {
                    byte[] bytes = new byte[file.Length];
                    file.Read(bytes, 0, (int)file.Length);
                    stream.Write(bytes, 0, (int)file.Length);
                }
                blobClient.Upload(stream);
            }
            var url = blobClient.Uri.AbsoluteUri;
        }

    }
}
