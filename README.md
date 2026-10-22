# Clínica Aurora — Consultas e Cuidado

**Aplicação web para gestão de uma clínica fictícia, desenvolvida com Ruby on Rails 8 como projeto educacional.**

- **Status:** Em desenvolvimento
- **Tipo:** Projeto de estágio
- **Uso:** Público
- **Idioma da interface:** Português brasileiro
- **Idioma do código:** Inglês internacional

> **[NOTA!]**
> A Clínica Aurora é fictícia. O sistema utiliza dados inventados e destina-se a fins educacionais e de demonstração, não ao gerenciamento de pacientes reais.

## Sobre o projeto

A Clínica Aurora é uma aplicação web que tem como objetivo centralizar o atendimento administrativo de uma clínica particular em uma única plataforma.

O sistema foi idealizado para permitir que visitantes conheçam as especialidades e os profissionais disponíveis, que pacientes realizem e acompanhem seus próprios agendamentos e que a gestora organize a agenda, os cadastros e os recebimentos da clínica.

O projeto busca aplicar práticas de desenvolvimento utilizadas em aplicações reais, incluindo organização MVC, validação de dados, controle de acesso, integridade do banco de dados, testes automatizados e documentação técnica.

## Objetivos

- Desenvolver uma aplicação web utilizando Ruby on Rails.
- Aplicar o padrão arquitetural Model-View-Controller (MVC).
- Implementar operações CRUD para os cadastros administrativos.
- Modelar relacionamentos entre usuários, pacientes, profissionais, especialidades, vagas, consultas e recebimentos.
- Implementar autenticação e autorização de usuários.
- Garantir a integridade dos agendamentos e dos registros financeiros.
- Desenvolver testes automatizados para as principais regras de negócio.
- Preparar uma demonstração reproduzível e documentada da aplicação.

## Funcionalidades

### Site público

- [x] Página inicial e informações institucionais da clínica.
- [ ] Catálogo de especialidades e respectivos preços.
- [ ] Listagem e detalhes dos profissionais.
- [ ] Consulta de horários disponíveis.
- [ ] Informações de endereço, contato e funcionamento.

### Autenticação e portal do paciente

- [ ] Cadastro de pacientes.
- [ ] Login, logout e recuperação de senha.
- [ ] Perfil do paciente.
- [ ] Agendamento e cancelamento de consultas.
- [ ] Visualização de consultas futuras e histórico.
- [ ] Validação de acesso aos próprios registros.

### Administração

- [ ] Painel administrativo e agenda diária.
- [ ] Cadastro, edição e desativação de especialidades e profissionais.
- [ ] Cadastro e gerenciamento de pacientes.
- [ ] Publicação, bloqueio e desbloqueio de horários.
- [ ] Agendamento em nome de pacientes já cadastrados.
- [ ] Registro de consultas realizadas e faltas.
- [ ] Registro de recebimentos e consulta de totais financeiros.

### Notificações e qualidade

- [ ] E-mails de confirmação e cancelamento.
- [ ] Atualizações de interface utilizando Hotwire.
- [ ] Testes automatizados de modelos, requisições e jornadas principais.
- [ ] Verificação de acessibilidade, navegação por teclado e telas menores.
- [ ] Publicação de uma versão de demonstração com HTTPS.

## Perfis de acesso

A aplicação considera três contextos de utilização.

| Perfil    | Responsabilidades                                                                                                      |
| --------- | ---------------------------------------------------------------------------------------------------------------------- |
| Visitante | Consultar informações institucionais, especialidades, profissionais, preços e horários disponíveis.                    |
| Paciente  | Gerenciar o próprio perfil e consultar, agendar ou cancelar suas próprias consultas, respeitando as regras do sistema. |
| Gestora   | Administrar cadastros, organizar horários, acompanhar consultas e registrar recebimentos.                              |

A autorização deve ser aplicada no servidor. Ocultar botões ou links na interface não substitui a verificação de permissões.

## Regras de negócio principais

- **Duração:** cada consulta tem duração de 30 minutos.
- **Expediente:** de segunda a sexta-feira, das 08h às 12h e das 13h às 18h.
- **Grade de horários:** as consultas começam em minutos `00` ou `30`.
- **Fuso horário:** `America/Sao_Paulo`.
- **Disponibilidade:** uma vaga não pode ter mais de uma consulta ativa.
- **Cancelamento pelo paciente:** permitido quando faltam pelo menos 24 horas para a consulta.
- **Atendimento:** a gestora registra a realização ou a falta depois do horário previsto para o término.
- **Preço:** o valor confirmado no agendamento é preservado no registro da consulta.
- **Recebimentos:** uma consulta realizada pode ter um único recebimento, no valor reservado.
- **Privacidade:** pacientes não podem visualizar ou modificar os registros de outras pessoas.

## Tecnologias

A stack definida para o projeto compreende:

- **Ruby:** versão 4.0.6.
- **Ruby on Rails:** linha 8.1.4.
- **PostgreSQL:** banco de dados definido pelo briefing.
- **HTML e ERB:** estrutura e renderização das páginas.
- **CSS:** apresentação das interfaces.
- **Importmap:** gerenciamento de módulos JavaScript.
- **Hotwire:** Turbo e Stimulus para interações progressivas.
- **Minitest:** testes automatizados.
- **Git e GitHub:** controle de versão e hospedagem do código-fonte.

As versões e tecnologias listadas devem corresponder à configuração efetiva da aplicação.

## Pré-requisitos

Antes de executar o projeto, verifique se o ambiente possui:

- Ruby e Rails na versão definida pelo projeto.
- Bundler.
- Dependências Ruby instaláveis pelo Bundler.
- PostgreSQL configurado e em execução.
- Git.

## Como executar localmente

### 1. Clonar o repositório

Substitua a URL de exemplo pelo endereço real do repositório.

```bash
git clone 
cd aurora
```

### 2. Instalar as dependências

```bash
bundle install
```

### 3. Configurar o banco de dados

Confira `config/database.yml` e configure as credenciais necessárias no ambiente local, sem adicioná-las ao repositório.

### 4. Preparar o banco

```bash
bin/rails db:prepare
```

### 5. Iniciar a aplicação

```bash
bin/rails server
```

Depois de iniciar o servidor, acesse:

[http://localhost:3000](http://localhost:3000)

Os comandos acima pressupõem que a configuração do banco esteja pronta e que as dependências necessárias tenham sido instaladas.

## Dados de demonstração

A aplicação deverá utilizar dados inteiramente fictícios.

Quando os seeds estiverem implementados, eles deverão permitir recriar os cenários de demonstração sem duplicar registros e sem apagar o banco de dados por padrão.

Para carregar os seeds:

```bash
bin/rails db:seed
```

Os e-mails de exemplo devem utilizar domínios reservados para demonstração, e as credenciais administrativas não devem ser armazenadas no repositório.


## Estrutura do projeto

A aplicação segue a organização convencional do Rails.

```text
aurora
├── app
│   ├── assets
│   ├── controllers
│   ├── helpers
│   ├── javascript
│   ├── jobs
│   ├── mailers
│   ├── models
│   └── views
├── bin
│   ├── brakeman
│   ├── bundler-audit
│   ├── ci
│   ├── dev
│   ├── docker-entrypoint
│   ├── importmap
│   ├── jobs
│   ├── kamal
│   ├── rails
│   ├── rake
│   ├── rubocop
│   ├── setup
│   └── thrust
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── bundler-audit.yml
│   ├── cable.yml
│   ├── cache.yml
│   ├── ci.rb
│   ├── credentials.yml.enc
│   ├── database.yml
│   ├── deploy.yml
│   ├── environment.rb
│   ├── environments
│   ├── importmap.rb
│   ├── initializers
│   ├── locales
│   ├── master.key
│   ├── puma.rb
│   ├── queue.yml
│   ├── recurring.yml
│   ├── routes.rb
│   └── storage.yml
├── config.ru
├── db
│   ├── cable_schema.rb
│   ├── cache_schema.rb
│   ├── queue_schema.rb
│   └── seeds.rb
├── Dockerfile
├── Gemfile
├── Gemfile.lock
├── lib
│   └── tasks
├── log
│   └── development.log
├── public
│   ├── 400.html
│   ├── 404.html
│   ├── 406-unsupported-browser.html
│   ├── 422.html
│   ├── 500.html
│   ├── icon.png
│   ├── icon.svg
│   └── robots.txt
├── Rakefile
├── README.md
├── script
├── storage
├── test
│   ├── controllers
│   ├── fixtures
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   └── test_helper.rb
├── tmp
│   ├── cache
│   ├── pids
│   └── storage
└── vendor
    └── javascript
```


## Referências

- [Rails Getting Started 8.1 - estrutura, MVC e primeiros fluxos:](https://guides.rubyonrails.org/v8.1/getting_started.html)
- [Rails Security - base de autenticação e cadastro adicional:](https://guides.rubyonrails.org/security.html)
- [Turbo Frames - atualização de parte da página:](https://turbo.hotwired.dev/handbook/frames)
- [Turbo Streams - alterações de elementos pela resposta:](https://turbo.hotwired.dev/handbook/streams)
- [Stimulus - controladores pequenos sobre HTML:](https://stimulus.hotwired.dev/handbook/introduction)
- [Active Record Pessimistic Locking - transações e bloqueios de linha:](https://api.rubyonrails.org/classes/ActiveRecord/Locking/Pessimistic.html)
- [Active Storage - evolução com foto de profissional:](https://guides.rubyonrails.org/active_storage_overview.html)
- [Active Job 8.0 - tarefas e Solid Queue:](https://guides.rubyonrails.org/v8.0/active_job_basics.html)
