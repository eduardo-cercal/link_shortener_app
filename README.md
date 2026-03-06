# Link Shortener App 🔗

Um encurtador de links desenvolvido em **Flutter**, projetado como um ambiente de estudo avançado para **Clean Architecture**, **Testes Automatizados (Unitários e Widget/Golden)** e padrões de projeto.

## 🎯 Objetivos do Projeto

Este repositório foi criado com o intuito de aplicar e consolidar conhecimentos em:
- **Clean Architecture:** Divisão clara entre as camadas de Data, Domain e Presentation.
- **Testes de Unidade:** Cobertura de lógica de negócios e Use Cases.
- **Testes de Widget (Golden Tests):** Garantia de fidelidade visual da UI pixel-a-pixel.
- **Injeção de Dependências:** Uso de Factories para desacoplamento de serviços e datasources.
- **Gerenciamento de Estado:** Implementação com **GetX** (conforme identificado na estrutura do projeto).

## 🏗️ Arquitetura e Estrutura

O projeto segue uma estrutura baseada em camadas dentro de cada funcionalidade (`features/home`):

- **Data:** Implementação de `DataSources` (Remote com Dio e Local com Hive), Repositórios e Models.
- **Domain:** Definição de `Entities`, `Repositories` (interfaces) e `UseCases` (regra de negócio pura).
- **Presentation:** Widgets, Controllers (GetX) e gerenciamento de estado da UI.
- **Factories:** Camada dedicada à criação e injeção de instâncias, facilitando a testabilidade e manutenção.
- **Core:** Componentes compartilhados, utilitários, constantes e classes de erro globais.

## 🛠️ Tecnologias Utilizadas

- **Framework:** [Flutter](https://flutter.dev/)
- **Gerenciamento de Estado:** [GetX](https://pub.dev/packages/get)
- **Cliente HTTP:** [Dio](https://pub.dev/packages/dio)
- **Persistência Local:** [Hive](https://pub.dev/packages/hive)
- **Testes:**
  - `flutter_test` (Unitários e Widget)
  - `golden_screenshot` (Para Golden Tests visuais)
  - `mocktail` (Para mocking de dependências)

## 🧪 Estratégia de Testes

O grande diferencial deste projeto é a sua robustez em testes:

1. **Testes Unitários:** Validam o comportamento dos `UseCases` e a lógica de parsing nos `Mappers` e `Models`.
2. **Widget Tests:** Garantem que os componentes de UI (como `InputLinkWidget` e `AliasLinkWidget`) reajam corretamente às interações do usuário.
3. **Golden Tests:** Utilizados para capturar o estado visual dos widgets e compará-los com "snapshots" de referência, evitando regressões de design.

### Como rodar os testes:
```bash
# Rodar todos os testes
flutter test

# Atualizar os Golden Files (se houver mudanças intencionais na UI)
flutter test --update-goldens

```

## 🚀 Como Executar o Projeto

1. **Clone o repositório:**
```bash
git clone [https://github.com/eduardo-cercal/link_shortener_app.git](https://github.com/eduardo-cercal/link_shortener_app.git)

```


2. **Instale as dependências:**
```bash
flutter pub get

```

3. **Inicie o app:**
```bash
flutter run

```



---

Desenvolvido por [Eduardo Cercal](https://www.google.com/search?q=https://github.com/eduardo-cercal) para estudos de arquitetura e qualidade de software.
