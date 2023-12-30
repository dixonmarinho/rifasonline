using AutoMapper;
using Sorteio.Controllers;
using Sorteio.CrossCutting.MappingGroups;
using Sorteio.Data;
using Sorteio.Data.Repository;
using Sorteio.Domain.Business;
using Sorteio.Domain.IBusiness;
using Sorteio.Test;
using System;
using Xunit;

namespace Sorteios.Portal.Controller
{
    public class Pagamento : BaseTest
    {
        [Fact]
        public async void Pagamento_Pagos()
        {
            var configuration = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<DomainToData>();
                cfg.AddProfile<DataToDomain>();
            });
            IMapper mapper = configuration.CreateMapper();
            var context = new SqlDataContext();
            var repository = new SorteiosRepository(context, mapper);
            var sorteio = new SorteiosBusiness(repository);

            PagamentoController _pagamentos = new PagamentoController(sorteio);
            await _pagamentos.Index();
        }
    }
}
