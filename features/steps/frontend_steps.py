from behave import given, when, then
from features.pages.frontend_page import FrontEndPage
from features.utils.frontend_utils import FrontEndUtils
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
import time

# ------------------------------
# Steps: Cadastro de novo usuário com sucesso
# ------------------------------

@given('que estou na página de cadastro')
def step_impl(context):
    context.driver.get(f"{context.base_url}/cadastrarusuarios")


@when('eu preencho os campos obrigatórios')
def step_impl(context):
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_NOME).send_keys('Caio Santos')
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_EMAIL).send_keys('caio.santos@ambev.com.br')
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_SENHA_CADASTRO).send_keys('caioambev1988')


@when('seleciono checkbox para Cadastrar como admistrador')
def step_impl(context):
    context.driver.find_element(By.XPATH, FrontEndPage.CHECKBOX_ADMIN).click()


@when('clico no botão Cadastrar')
def step_impl(context):
    context.driver.find_element(By.XPATH, FrontEndPage.BOTAO_CADASTRAR).click()


@then('eu vejo a mensagem de sucesso "Cadastro realizado com sucesso"')
def step_impl(context):
    time.sleep(2)
    context.driver.find_element(By.XPATH, FrontEndPage.MENSAGEM_SUCESSO_CADASTRO)
    FrontEndUtils.salvar_evidencia(context)

# ------------------------------
# Steps: Login com usuário cadastrado
# ------------------------------

@given('que estou na página de login')
def step_impl(context):
    context.driver.get(f"{context.base_url}/login")


@when('eu preencho os campos obrigatórios de login')
def step_impl(context):
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_EMAIL).send_keys('caio.santos@ambev.com.br')
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_SENHA_LOGIN).send_keys('caioambev1988')


@when('clico em Entrar')
def step_impl(context):
    context.driver.find_element(By.XPATH, FrontEndPage.BOTAO_ENTRAR).click()


@then('sou redirecionado para a página inicial')
def step_impl(context):
    time.sleep(2)
    context.driver.find_element(By.XPATH, FrontEndPage.MENSAGEM_BEM_VINDO)
    FrontEndUtils.salvar_evidencia(context)

# ------------------------------
# Steps: Excluir próprio usuário
# ------------------------------

@given('realizo o login')
def step_impl(context):
    context.driver.get(f"{context.base_url}/login")
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_EMAIL).send_keys('caio.santos@ambev.com.br')
    context.driver.find_element(By.XPATH, FrontEndPage.CAMPO_SENHA_LOGIN).send_keys('caioambev1988')
    context.driver.find_element(By.XPATH, FrontEndPage.BOTAO_ENTRAR).click()
    time.sleep(2)
    context.driver.find_element(By.XPATH, FrontEndPage.MENSAGEM_BEM_VINDO)


@given('clico na aba Listar Usuários')
def step_impl(context):
    time.sleep(2)
    context.driver.find_element(By.XPATH, FrontEndPage.ABA_LISTAR_USUARIOS).click()


@when('clico em excluir meu próprio usuário')
def step_impl(context):
    usuario = "Caio Santos"

    # Aguarda a tabela aparecer
    WebDriverWait(context.driver, 10).until(
        EC.presence_of_all_elements_located((By.XPATH, '//table/tbody/tr'))
    )

    linhas = context.driver.find_elements(By.XPATH, '//table/tbody/tr')
    linha_usuario = None

    for i, linha in enumerate(linhas, start=1):
        try:
            nome_xpath = f'//table/tbody/tr[{i}]/td[1]'
            nome_elemento = context.driver.find_element(By.XPATH, nome_xpath)
            if usuario.lower() in nome_elemento.text.lower():
                linha_usuario = i
                break
        except:
            continue

    if not linha_usuario:
        raise Exception(f"Usuário '{usuario}' não encontrado na tabela.")

    print(f"Usuário '{usuario}' encontrado na linha {linha_usuario}")

    # XPath dinâmico para o botão de excluir
    botao_excluir_xpath = f'//table/tbody/tr[{linha_usuario}]/td[5]/div/button[2]'
    botao_excluir = WebDriverWait(context.driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, botao_excluir_xpath))
    )

    # Mover o mouse até o botão e clicar
    actions = ActionChains(context.driver)
    actions.move_to_element(botao_excluir).click().perform()
    botao_excluir.click()


@then('eu vejo a mensagem "Não é possível excluir o próprio usuário!"')
def step_impl(context):
    time.sleep(3)
    alert_xpath = FrontEndPage.MENSAGEM_NAO_EXCLUIR_PROPRIO_USUARIO
    elemento_alerta = WebDriverWait(context.driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, alert_xpath))
    )
    ActionChains(context.driver).move_to_element(elemento_alerta).perform()
    print("Alerta de erro visível.")
    time.sleep(1)
    FrontEndUtils.salvar_evidencia(context)
