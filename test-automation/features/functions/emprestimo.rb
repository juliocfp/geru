class Emprestimo
    def gerar_dados_emprestimo_valido
        @id = Random.rand(1...9999)
        @nome = "Julio Parra"
        @cpf = "999.999.999-99"
        @vl_emprestimo = "1000"
        @nr_parcelas = "10"
        @vl_parcelas = "100"
    end
 
    def gerar_dados_emprestimo_invalido(campo)
        gerar_emprestimo_valido
        case campo
        when "id"
            @id = ""
        when "nome"
            @nome = ""
        when "cpf"
            @cpf = ""
        when "vl_emprestimo"
            @vl_emprestimo = ""
        when "nr_parcelas"
            @nr_parcelas = ""
        when "vl_parcelas"
            @vl_parcelas = ""
        else
            puts "campo para troca não encontrado"
        end
    end
 
    def api_criar_emprestimo(token)
        HTTParty.post("www.urlficticia.com.br/api/v1/emprestimos",
            :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" },
            :body => { "id": @id, "nome": @nome, "cpf": @cpf, "vl_emprestimo": @vl_emprestimo,
                        "nr_parcelas": @nr_parcelas, "vl_parcelas": @vl_parcelas }.to_json)
    end
 
    def api_criar_emprestimo_json_invalido(token)
        HTTParty.post("www.urlficticia.com.br/api/v1/emprestimos",
            :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" },
            :body => { "id": "" })
    end

    def buscar_emprestimo(id, token)
        HTTParty.get("www.urlficticia.com.br/api/v1/emprestimos/#{id}",
            :headers => { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" })
    end

    def retornar_id_emprestimo(json_string)
        parsed_json = JSON.parse(json_string)
        parsed_json['id']
    end
end
