# Ruby API Automation

Este é um projeto pessoal desenvolvido em **Ruby** para a automação de testes de APIs, utilizando as ferramentas **Cucumber** e **Gherkin**, com foco em organização, escalabilidade e integração contínua.

## Principais características

- Estrutura bem organizada, facilitando a manutenção e a adição de novos cenários de teste.
- Uso do **Cucumber** para escrita de cenários em linguagem natural, garantindo clareza e alinhamento entre desenvolvedores e partes interessadas.
- Integração com **Gherkin**, permitindo a definição precisa de comportamentos esperados.
- Utilização da biblioteca **Faker** para geração de dados dinâmicos e realistas, simulando diversos cenários de teste.
- Pronto para integração com pipelines de **CI/CD** em plataformas como **GitLab** ou **GitHub**, garantindo testes de regressão automatizados a cada nova implementação.

## Intruções para configuração de ambiente
- Instalar o Ruby
- Instalar o gerenciador de Gems: **- gem install bundler**
- Instalar as Gems do projeto: **- bundle install**

## Exemplos de execução
- Execução de todos os cenários do projeto: **cucumber**
- Execução de cenários por TAG: **cucumber -t @cenario1**

## Objetivo

O projeto foi criado para aprimorar habilidades em automação de testes e oferecer uma base robusta para validação de APIs RESTful. Com sua estrutura modular, ele permite fácil adaptação para novos cenários e funcionalidades, além de suportar fluxos de entrega contínua para melhorar a qualidade e a confiabilidade do software.
