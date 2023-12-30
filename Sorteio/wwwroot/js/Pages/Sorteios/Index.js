$(document).ready(function () {

    tabelaListaSorteios = $('#datatableListaSorteios').DataTable({
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json"
        },
        "columns.data": [
            null,
            null,
            null,
            null,
            { "width": "110px" }
        ],
        responsive: true,
        "bInfo": false,
        "lengthChange": false,
        language: {
            search: "",
            searchPlaceholder: "Pesquisar",
            paginate: {
                previous: '‹‹',
                next: '››'
            },
            "emptyTable": "Nenhum resultado encontrado",
        },
        "fnInitComplete": function (oSettings) {
            oSettings.oLanguage.sZeroRecords = "Nenhum resultado encontrado"
        }
    });



});

function AbrirInformaçõesUsuario(idUsuario) {

    $.ajax({
        url: "/Sorteios/InformacoesDoUsuarioGanhadorPorId/" + idUsuario,
        type: "GET",
        contentType: 'application/json; charset=UTF-8',
        dataType: "json",
        success: function (response) {
            console.log(response)
            if (!response.erro) {
                LimparCamposModalGanhadorSorteio();
                PreencherModalGanhadorSorteio(response)
            }
            else {
                swal("Opss", response.mensagem, "error");
            }
        },
        error: function (response) {
            swal("Erro", "Aconteceu um imprevisto. Contate o administrador", "error");
            console.log(response);
        }
    });

    $('#modalInformacoesUsuario').modal();
}

function LimparCamposModalGanhadorSorteio() {
    $('#nome').val('');
    $('#cpf').val('');
    $('#data_de_nascimento').val('');
    $('#email').val('');
    $('#telefone').val('');
    $('#cep').val('');
    $('#logadouro').val('');
    $('#numero').val('');
    $('#bairro').val('');
    $('#complemento').val('');
    $('#estado').val('');
    $('#cidade').val('');
    $('#referencia').val('');
}

function PreencherModalGanhadorSorteio(dados) {
    $('#nome').val(dados.nome);
    $('#cpf').val(dados.cpf);
    $('#data_de_nascimento').val(ConverterDataParaUSA(dados.data_de_nascimento));
    $('#email').val(dados.email);
    $('#telefone').val(dados.celular);
    $('#cep').val(dados.cep);
    $('#logadouro').val(dados.logadouro);
    $('#numero').val(dados.numero);
    $('#bairro').val(dados.bairro);
    $('#complemento').val(dados.complemento);
    $('#estado').val(dados.estado);
    $('#cidade').val(dados.cidade);
    $('#referencia').val(dados.referencia);
}

function ObterParticipantesSorteioPorId(idSorteio) {
    $.ajax({
        url: "/Sorteios/ObterTodosSorteioAtivosPorID/" + idSorteio,
        type: "GET",
        contentType: 'application/json; charset=UTF-8',
        dataType: "json",
        success: function (response) {
            console.log(response)
            if (!response.erro) {
                ViewInformacoesNumeros(response)
            }
            else {
                swal("Opss", response.mensagem, "error");
            }
        },
        error: function (response) {
            swal("Erro", "Aconteceu um imprevisto. Contate o administrador", "error");
            console.log(response);
        }
    });
    $('#modelInfoNumeros').modal();
}


function ViewInformacoesNumeros(data) {
    //datanumbers
    var str = "";
    for (var i = 0, len = data.length; i < len; i++) {
        str = str +
            "<tr>" +
            "<td>" + data[i].id_pedido + "</td>" +
            "<td>" + data[i].nome + "</td>" +
            "<td>" + data[i].celular + "</td>";
        if (data[i].id_status_pedido === 1) {
            str = str + "<td></td>";
            str = str + "<td><button type=\"button\" class=\"btn-sm btn-info\" onclick=\"ConfirmarPagamento(" + data[i].id_pedido + ")\">Ação</button></td>"
            "</tr>";
        }
        else {
            str = str + "<td><button type=\"button\" class=\"btn-sm btn-dark\" onclick=\"VisualizarNumerosPorPedido(" + data[i].id_pedido + ")\">Pedidos</button></td>"
            str = str + "<td></td>";
        }

    }
    $("#datanumbers").html(str);
}
