** CONFIGURAÇÃO E INSTALAÇÃO **

Para execução dos testes, é necessário ter instalado na máquina a versão 2.5.3-1 do Ruby.

Executar os seguintes comandos para instalar as gems utilizadas no projeto. Essas serão as gems utilizadas nos testes. gem install bundler gem install cucumber gem install rspec gem install httparty

Executar o comando "bundle install" no diretório test-automation. Com esse comando, o Bundler gera o arquivo Gemfile.lock com as gems e suas versões dentro do projeto.

** ESTRUTURA **

O projeto está organizado, basicamente, em quatro pastas: functions, specifications, step_definitions e support. Na pasta functions, separei as funções em Ruby que os passos executam, deixando-os mais limpos e legíveis. Na pasta specifications, estão todos os cenários do projeto escritos em gherkin, no modelo BDD. Na pasta step_definitions, estão os passos a serem executados em Ruby, refletidos dos cenários. A pasta support fica o arquivo env.rb, resposável por estabelecer as gems que iremos usar no projeto.

** EXECUÇÃO **

Para iniciar os testes, acesse o diretório raiz do projeto e execute o comando "cucumber". Esse comando irá executar todos os testes do projeto.