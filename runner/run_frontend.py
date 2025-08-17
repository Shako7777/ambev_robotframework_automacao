from behave.__main__ import main

# Caminho para a feature de frontend e que roda todos cenários
main("features/frontend.feature")

# Para rodar somente o cenários que dejesa, descomente e rode a partir da TAG
#main("--tags=cadastro")
#main("--tags=loginusuariocadastrado")
#main("--tags=excluirpropriousuario")

# Comando para rodar no terminal, por ser Python puro não é possível executar pelo VSCode Run Tests
#python runner/run_frontend.py
# ou behave
#behave


