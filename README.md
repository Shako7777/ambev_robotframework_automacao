# 🧪 Projeto de Automação de Testes - Ambev

Este projeto contém a automação de testes para a aplicação ServeRest (front-end e back-end) desenvolvida para Ambev.

## 📋 Visão Geral

O projeto utiliza **Robot Framework** para automação de testes de interface web, api e **Behave (Python)** para testes BDD. A estrutura está organizada para permitir testes completos tanto do front-end quanto do back-end.

## 🏗️ Arquitetura do Projeto

```
ambev_robotframework_automacao/
├── backend-tests/          # Testes de API/Back-end
│   ├── resources/          # Keywords customizadas
│   │   └── serverest_keywords.resource    
│   ├── tests/              # Casos de teste
│   │   └── backend_tests.robot            
│   └── variables/          # Endpoints
│       └── endpoints.robot                
├── frontend-tests/         # Testes de Interface Web
│   ├── drivers/            # WebDrivers (ChromeDriver)
│   ├── pages/              # Page Objects
│   │   └── frontend_page.robot
│   ├── resources/          # Keywords customizadas
│   │   └── frontend_keywords.robot
│   ├── tests/              # Casos de teste
│   │   └── frontend_tests.robot
│   └── utils/              # Utilitários
│       └── frontend_utils.robot
├── features/               # Testes BDD com Behave
│   ├── environment.py      # Configuração do Behave
│   ├── frontend.feature    # Cenários BDD
│   ├── pages/              # Page Objects Python
│   │   └── frontend_page.py
│   ├── steps/              # Steps do Behave
│   │   └── frontend_steps.py
│   └── utils/              # Utilitários Python
│       └── frontend_utils.py
├── runner/                 # Executores de teste
│   └── run_frontend.py
└── reports/                # Relatórios gerados
    ├── log.html
    ├── report.html
    └── output.xml
```

## 🚀 Tecnologias Utilizadas

- **Robot Framework** - Framework principal para automação
- **SeleniumLibrary** - Para automação web
- **Python** - Para testes BDD com Behave
- **ChromeDriver** - WebDriver para Chrome
- **ServeRest** - Aplicação de testes Web (https://front.serverest.dev)
- **ServeRest** - Aplicação de testes Apis (https://serverest.dev/#/)

## 🎯 Tipos de Testes

### Testes de Front-end (Robot Framework)
- **Cadastro de usuários** - Validação do formulário de cadastro
- **Login de usuários** - Autenticação e validação de acesso
- **Exclusão de usuário** - Teste de tentativa de exclusão do próprio usuário
- **Validações de mensagens** - Verificação de mensagens de sucesso/erro

### Testes de Back-end (Robot Framework)
- **Endpoints de API** - Testes dos endpoints REST
- **Validações de contrato** - Verificação de respostas JSON
- **Testes de integração** - Fluxos completos via API

### Testes BDD (Behave)
- **Cenários de aceitação** - Testes baseados em comportamento
- **Documentação viva** - Features documentadas em Gherkin

## 🏃‍♂️ Como Executar os Testes

### 📋 Passo a Passo para Execução

#### 1. Verificar Instalação das Dependências
Antes de executar os testes, certifique-se de que todas as bibliotecas necessárias estão instaladas:

```bash
# Verificar se a RequestsLibrary está instalada (para testes de API)
pip list | findstr robotframework-requests

# Verificar se a SeleniumLibrary está instalada (para testes de UI)
pip list | findstr robotframework-seleniumlibrary

# Verificar versão do Robot Framework
robot --version

# Verificar instalação do Behave
behave --version

# Verificar instalação do Selenium
pip show selenium
```

#### 2. Instalar Dependências (se necessário)
Se alguma biblioteca não estiver instalada, execute:

```bash
# Instalar RequestsLibrary (testes de API)
pip install robotframework-requests

# Instalar SeleniumLibrary (testes de UI)
pip install robotframework-seleniumlibrary

# Instalar Behave (testes BDD)
pip install behave

# Instalar dependências Selenium
pip install selenium
```

#### 3. Verificar Estrutura do Projeto
Certifique-se de que está no diretório correto antes de executar os testes:

```bash
# Verificar estrutura
ls -la backend-tests/
ls -la frontend-tests/
```

### Executar Testes de Front-end
```bash
# Navegar para o diretório frontend-tests
cd frontend-tests

# Executar todos os testes
robot tests/

# Executar teste específico
robot tests/frontend_tests.robot

# Executar com tags específicas
robot --include Excluir tests/frontend_tests.robot
```

### Executar Testes de Back-end
```bash
# Navegar para o diretório backend-tests
cd backend-tests

# Executar todos os testes
robot tests/
```

### Executar Testes BDD
```bash
# Navegar para o diretório raiz
cd features

# Executar testes BDD
behave
```

## 📊 Relatórios & Screenshot (Frontend)

Após a execução dos testes, os relatórios são gerados automaticamente e os Screenshot com os nomes dos cenários de frontend com timestamp:
- **log.html** - Log detalhado de execução
- **report.html** - Relatório executivo
- **output.xml** - Resultados em formato XML

## 🔧 Configuração do Ambiente

### Pré-requisitos
- Python 3.8+
- Chrome Browser
- ChromeDriver (compatível com sua versão do Chrome)

## 📝 Estrutura dos Testes

### Padrão Page Object
- **Pages/** - Elementos e ações de cada página
- **Resources/** - Keywords reutilizáveis
- **Tests/** - Casos de teste específicos

### Padrão BDD
- **Features/** - Cenários em linguagem natural
- **Steps/** - Implementação dos steps
- **Environment.py** - Configurações globais

## 🎭 Exemplos de Uso

### Teste de Exclusão de Próprio Usuário
```robot
Excluir Proprio Usuario
    [Documentation]    Encontra o usuário Caio Santos na tabela e clica no botão de excluir
    Wait Until Element Is Visible    //table/tbody    30s
    ${linhas}=    Get WebElements    //table/tbody/tr
    # ... resto da lógica ...
```

## 📞 Suporte

Para questões relacionadas ao projeto, consulte:
- Documentação do Robot Framework: https://robotframework.org/
- Documentação do ServeRest: https://serverest.dev/
- Issues no repositório do projeto

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto foi desenvolvido para uso de estudos por Caio Vinicius dos Santos.
