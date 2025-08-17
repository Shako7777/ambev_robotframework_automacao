from selenium import webdriver

def before_scenario(context, scenario):
    context.base_url = "https://front.serverest.dev"
    context.driver = webdriver.Chrome() # Se precisar atualize sua versão na sua máquina ou coloque o chromewebdriver na raiz do projeto
    context.driver.maximize_window()

def after_scenario(context, scenario):
    if context.driver:
        context.driver.quit()
