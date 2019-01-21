# encoding: utf-8

autenticacao = Autenticacao.new

Dado("que o client possue um token válido para se comunicar com o serviço") do
    @token = autenticacao.gerar_autenticacao_valida
end

Dado("que o client possue um token inválido") do
    @token = autenticacao.gerar_autenticacao_invalida
end

Então("o serviço deve retornar uma mensagem de erro na autenticação") do
    expect(@response.code).to eq 401
    expect(@response.body).to include("Token não é válido.")
end
