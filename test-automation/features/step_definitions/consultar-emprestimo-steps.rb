# encoding: utf-8

autenticacao = Autenticacao.new
emprestimo = Emprestimo.new

Dado("que o client tem um empréstimo criado") do
    @token = autenticacao.gerar_autenticacao_valida
    emprestimo.gerar_dados_emprestimo_valido
    @response_criacao = emprestimo.api_criar_emprestimo @token
end

Dado("que o client não tem um empréstimo criado") do
    @response_criacao_inexistente = ""
end

Quando("o client consultar o serviço de empréstimo informando o ID do empréstimo") do
    @response_busca = emprestimo.buscar_emprestimo(emprestimo.retornar_id_emprestimo(@response_criacao), @token)
end

Quando("o client consultar o serviço de empréstimo informando um ID inexistente") do
    @response_busca = emprestimo.buscar_emprestimo(emprestimo.retornar_id_emprestimo(@response_criacao_inexistente), @token)
end

Então("o serviço deve retornar as informações do empréstimo criado") do
    expect(@response_busca.code).to eq 200
    expect(@response_busca.body).to include("{ 'id': 123, 'nome': 'Julio Parra', 'cpf': '999.999.999-99', 'vl_emprestimo': '1000',
        'nr_parcelas': '10', 'vl_parcelas': '100' }")
end

Então("o serviço deve retornar uma mensagem de erro na busca") do
    expect(@response_busca.code).to eq 404
    expect(@response_busca.body).to include("Empréstimo não encontrado.")
end
