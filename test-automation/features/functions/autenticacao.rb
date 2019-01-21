class Autenticacao
    def gerar_autenticacao_valida
        @username = "julio_parra"
        @password = "teste123"
        api_criar_autenticacao
    end

    def gerar_autenticacao_invalida
        @username = "julio_parra"
        @password = "senha_errada"
        api_criar_autenticacao
    end

    def api_criar_autenticacao
        HTTParty.post("www.urlficticia.com.br/api/v1/token",
            :headers => { 'Content-Type' => 'application/json' },
            :body => { username: @username, password: @password })
    end
end
