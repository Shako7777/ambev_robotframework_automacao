import os
from datetime import datetime

class FrontEndUtils:

    @staticmethod
    def salvar_evidencia(context):

        print("✅ Método salvar_evidencia foi chamado")  # <- teste
        
        # Nome do cenário vindo do contexto
        nome_cenario = context.scenario.name.replace(" ", "_").replace(":", "")
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

        # Caminho da raiz do projeto
        raiz_projeto = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
        nome_arquivo = f"Scenario_{nome_cenario}_{timestamp}.png"
        caminho_screenshot = os.path.join(raiz_projeto, nome_arquivo)

        # Tirar screenshot
        context.driver.save_screenshot(caminho_screenshot)
        print(f"✅ Screenshot salvo em: {caminho_screenshot}")

    
