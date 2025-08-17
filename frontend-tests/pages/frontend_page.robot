*** Variables ***
${BASE_URL}                        https://front.serverest.dev
${ABA_LISTAR_USUARIOS}             //a[@data-testid='listar-usuarios']
${BOTAO_CADASTRAR}                 //button[@data-testid="cadastrar"]
${BOTAO_ENTRAR}                    //button[@data-testid="entrar"]
${CAMPO_EMAIL}                     //input[@data-testid="email"]
${CAMPO_NOME}                      //input[@data-testid="nome"]
${CAMPO_SENHA_CADASTRO}            //input[@data-testid="password"]
${CAMPO_SENHA_LOGIN}               //input[@data-testid="senha"]
${CHECKBOX_ADMIN}                  //input[@data-testid="checkbox"]
${MENSAGEM_BEM_VINDO}              //*[contains(text(), 'Bem Vindo')]
${MENSAGEM_NAO_EXCLUIR_PROPRIO_USUARIO}   //*[contains(text(), 'Não é possível excluir o próprio usuário!')]
${MENSAGEM_SUCESSO_CADASTRO}       //*[contains(text(), 'Cadastro realizado com sucesso')]
${nome}    Caio Santos
