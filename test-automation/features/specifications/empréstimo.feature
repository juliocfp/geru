#language: pt

Funcionalidade: Disponibilizar endpoint para consulta e criação de empréstimo
    Como interface
    Gostaria de consultar e criar empréstimos via endpoint
    Para que possa fazer a interface para o usuário

    Cenário: Criar empréstimo válido
        Dado que o client possue todos os dados necessários para criação do empréstimo
            E que o client possue um token válido para se comunicar com o serviço
        Quando envio todos os dados para o serviço de criação de empréstimo
        Então o serviço deve criar o empréstimo com sucesso

    Esquema do Cenário: Campos obrigatórios
        Dado que o client não possue o campo <campo> para criação do empréstimo
            E que o client possue um token válido para se comunicar com o serviço
        Quando envio os dados que possuo para o serviço de criação de empréstimo
        Então o serviço deve retornar uma mensagem de erro exibindo os campos obrigatórios

        Exemplos:
        | campo         |
        | id            |
        | nome          |
        | cpf           |
        | vl_emprestimo |
        | nr_parcelas   |
        | vl_parcelas   |

    Cenário: JSON inválido
        Dado que o client possue um token válido para se comunicar com o serviço
        Quando envio todos os dados para o serviço de criação de empréstimo
        Então o serviço deve retornar uma mensagem de erro de formato JSON

    Cenário: Token inválido na criação
        Dado que o client possue todos os dados necessários para criação do empréstimo
            E que o client possue um token inválido
        Quando envio todos os dados para o serviço de criação de empréstimo
        Então o serviço deve retornar uma mensagem de erro na autenticação

    Cenário: Consultar empréstimo existente
        Dado que o client tem um empréstimo criado
            E que o client possue um token válido para se comunicar com o serviço
        Quando o client consultar o serviço de empréstimo informando o ID do empréstimo
        Então o serviço deve retornar as informações do empréstimo criado

    Cenário: Empréstimo inexistente
        Dado que o client não tem um empréstimo criado
            E que o client possue um token válido para se comunicar com o serviço
        Quando o client consultar o serviço de empréstimo informando um ID inexistente
        Então o serviço deve retornar uma mensagem de erro na busca

    Cenário: Token inválido na consulta
        Dado que o client tem um empréstimo criado
            E que o client possue um token inválido
        Quando o client consultar o serviço de empréstimo informando o ID do empréstimo
        Então o serviço deve retornar uma mensagem de erro na autenticação