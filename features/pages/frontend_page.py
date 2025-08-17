from dataclasses import dataclass

@dataclass(frozen=True)
class FrontEndPage:
    # Abas
    ABA_LISTAR_USUARIOS: str = "//a[@data-testid='listar-usuarios']"

    # Botões
    BOTAO_CADASTRAR: str = '//button[@data-testid="cadastrar"]'
    BOTAO_ENTRAR: str = '//button[@data-testid="entrar"]'

    # Campos
    CAMPO_EMAIL: str = '//input[@data-testid="email"]'
    CAMPO_NOME: str = '//input[@data-testid="nome"]'
    CAMPO_SENHA_CADASTRO: str = '//input[@data-testid="password"]'
    CAMPO_SENHA_LOGIN: str = '//input[@data-testid="senha"]'
    CHECKBOX_ADMIN: str = '//input[@data-testid="checkbox"]'

    # Mensagens
    MENSAGEM_BEM_VINDO: str = "//*[contains(text(), 'Bem Vindo')]"
    MENSAGEM_NAO_EXCLUIR_PROPRIO_USUARIO: str = "//*[contains(text(), 'Não é possível excluir o próprio usuário!')]"
    MENSAGEM_SUCESSO_CADASTRO: str = "//*[contains(text(), 'Cadastro realizado com sucesso')]"
