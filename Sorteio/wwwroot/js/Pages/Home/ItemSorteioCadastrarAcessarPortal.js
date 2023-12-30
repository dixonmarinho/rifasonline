$(document).ready(function () {

});

function CadastrarAcessarPortal() {


    if (VerificarCamposObrigatoriosCadastroUsuario()) {

        var senha = $('#senhaCadastro').val();

        if (senha.length >= 6) {

            var repetirSenha = $('#repetirSenhaCadastro').val();

            if (senha == repetirSenha) {

                var arrayItensEscolhidos = [];
                $('.numero-escolhido').each(function (i, element) {
                    var numero = $(element).text();
                    arrayItensEscolhidos.push(numero)
                })

                var jsonBody = {
                    "id_sorteio": parseInt($('#idSorteioSelecionado').val()),
                    "valor_total": ConverterParaFloat($('#valor_total').text()),
                    "usuario": GerarDadosJsonCadastrarUsuario(),
                    "numeroSorteios": GerarJsonNumerosSorteios(arrayItensEscolhidos)
                };

                $.ajax({
                    url: "/Login/CadastrarUsuarioCadastrarNumeros",
                    type: "POST",
                    contentType: 'application/json; charset=UTF-8',
                    dataType: "json",
                    data: JSON.stringify(jsonBody),
                    success: function (response) {
                        if (!response.erro) {
                            swal("Sucesso", response.mensagem, "success")
                                .then((okay) => {
                                    RealizarLoginSimples();
                                });
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
            }
            else {
                swal("Erro", "Verifique a senha!", "error");
            }

        }
        else
            swal("Erro", "Informe uma senha de pelo menos 6 caracteres", "error");

    }

}

// Dixon - Implementado
function ReserVarNumeros() {
    if (VerificarCamposObrigatoriosReservarNumeros()) {

        var arrayItensEscolhidos = [];
        $('.numero-escolhido').each(function (i, element) {
            var numero = $(element).text();
            arrayItensEscolhidos.push(numero)
        })

        var jsonBody = {
            "id_sorteio": parseInt($('#idSorteioSelecionado').val()),
            "valor_total": ConverterParaFloat($('#valor_total').text()),
            "usuario": GerarDadosJsonCadastrarUsuario(),
            "numeroSorteios": GerarJsonNumerosSorteios(arrayItensEscolhidos)
        };

        $.ajax({
            url: "/Login/CadastrarUsuarioCadastrarNumeros",
            type: "POST",
            contentType: 'application/json; charset=UTF-8',
            dataType: "json",
            data: JSON.stringify(jsonBody),
            success: function (response) {
                if (!response.erro) {
                    swal("Sucesso", response.mensagem, "success")
                        .then((okay) => {
                            //RealizarLoginSimples();
                            RedirecionarWhatsApp()
                        });
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


    }
}


function GerarDadosJsonCadastrarUsuario_OLD() {
    return {
        nome: $('#nomeCadastro').val().trim(),
        email: $('#emailCadastro').val().trim(),
        senha: $('#senhaCadastro').val().trim(),
        cpf: $('#cpfCadastro').val().trim(),
        celular: $('#telefoneCadastro').val().trim(),
    }
}

function GerarDadosJsonCadastrarUsuario() {
    return {
        nome: $('#nomeCadastro').val().trim(),
        email: $('#emailCadastro').val().trim(),
        senha: "A4547845A45",
        celular: $('#telefoneCadastro').val().trim(),
    }
}

function VerificarCamposObrigatoriosReservarNumeros() {

    if (IsNullOrEmpty($('#nomeCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Nome');
        return false;
    }
    else if (IsNullOrEmpty($('#emailCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Email');
        return false;
    }
    else if (IsNullOrEmpty($('#telefoneCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Telefone');
        return false;
    }
    else if (ObterValorCheckBoxOuDefault('checkPoliticas') == false) {
        swal("Erro", "É necessário aceitar os termos", "error");
        return false;
    }

    return true;
}


function VerificarCamposObrigatoriosCadastroUsuario() {

    if (IsNullOrEmpty($('#nomeCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Nome');
        return false;
    }
    else if (IsNullOrEmpty($('#emailCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Email');
        return false;
    }
    else if (IsNullOrEmpty($('#senhaCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Senha');
        return false;
    }
    else if (IsNullOrEmpty($('#cpfCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('CPF');
        return false;
    }
    else if (IsNullOrEmpty($('#telefoneCadastro').val().trim())) {
        MostrarModalErroCampoObrigatorioNaoPreenchido('Telefone');
        return false;
    }
    else if (ObterValorCheckBoxOuDefault('checkPoliticas') == false) {
        swal("Erro", "É necessário aceitar os termos", "error");
        return false;
    }
    else if (IsNullOrEmpty($('#g-recaptcha-response').val())) {
        swal("Erro", "É necessário verificar o reCAPTCHA", "error");
        return false;
    }

    return true;
}

function RealizarLoginSimples(email, senha) {

    var USUARIO_ADMIN = 1;
    var USUARIO_CLIENTE = 2;

    var jsonBody = {
        "email": $('#emailCadastro').val().trim(),
        "senha": $('#senhaCadastro').val().trim()
    };

    $.ajax({
        url: "/Login/Login",
        type: "POST",
        contentType: 'application/json; charset=UTF-8',
        dataType: "json",
        data: JSON.stringify(jsonBody),
        success: function (response) {
            console.log(response);
            if (response.erro) {
                swal("Erro", response.mensagem, "error");
            }
            else {
                if (parseInt(response.model.id_tipo_usuario) == USUARIO_ADMIN) {
                    window.location.href = "/Sorteios";
                }
                else if (parseInt(response.model.id_tipo_usuario) == USUARIO_CLIENTE) {
                    window.location.href = "/AcessoInterno";
                }
                else {
                    swal("Erro", "Aconteceu um imprevisto. Contate o administrador", "error");
                }
            }
        },
        error: function (response) {
            swal("Erro", response.mensagem, "error");
        }
    });

}

function RedirecionarWhatsApp() {
    window.location.href = "https://api.whatsapp.com/send?phone=5584999742506&text=Ol%C3%A1%2C%20realizei%20uma%20reserva%20de%20n%C3%BAmeros.";
}