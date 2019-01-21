# encoding: utf-8

emprestimo = Emprestimo.new

Dado("que o client possue todos os dados necessários para criação do empréstimo") do
    emprestimo.gerar_dados_emprestimo_valido
end

Dado("que o client não possue o campo {string} para criação do empréstimo") do |campo|
    @campo = campo
    emprestimo.gerar_dados_emprestimo_invalido @campo
end

Quando("envio todos os dados para o serviço de criação de empréstimo") do
    @response = emprestimo.api_criar_emprestimo @token
end

Então("o serviço deve criar o empréstimo com sucesso") do
    expect(@response.code).to eq 200
    puts @response.body
end

Então("o serviço deve retornar uma mensagem de erro exibindo os campos obrigatórios") do
    expect(@response.code).to eq 400
    expect(@response.body).to include("Campo #{@campo} é obrigatório.")
end

Então("o serviço deve retornar uma mensagem de erro de formato JSON") do
    expect(@response.code).to eq 400
    expect(@response.body).to include("Formato JSON inválido.")
end
