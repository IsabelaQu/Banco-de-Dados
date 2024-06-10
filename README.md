# AF NoSQL

## Descrição da Atividade 📓
### Etapa 1
> Um usuário configura seu navegador com os seguintes dados:
> 
> página inicial: www.google.com
> 
> Idioma preferido: Português do Brasil
> 
> Localização: São Paulo
> 
> Tema: Clássico
> 
> Mostrar favoritos: Sim
> 
> Zoom: 100%
> 
> Escreva os dados acima na notação JSON. Para esta atividade utilize o bloco de notas, salve o arquivo com o nome: localização_google_sp.json

### Etapa 2 
> Uma empresa deseja cadastrar seus funcionários. Ao verificar seus documentos, encontrou-se a seguinte planilha abaixo:
> 
> ![image](https://github.com/IsabelaQu/Banco-de-Dados/assets/124175141/25d33d9b-4839-42f0-b561-6c945291fd43)
> 
> Crie, conforme o modelo relacional, as tabelas normalizadas. Crie também um documento JSON que contenha esses dados.

### Etapa 3
> Crie um banco de dados NoSQL no Firebase conforme foi demonstrado no conteúdo da aula sobre banco de dados não relacionais;
> Ao término do exemplo, crie um segundo banco de dados, mas utilizando o tema Jogos;
> Nesse banco deve haver, coleções de personagens, jogos e fabricante;
> Relacione documentos de diferentes coleções.
> Para entrega desta atividade utilize o readme.md de um repositório remoto, crie os códigos json das etapas 1 e 2;
> 
> Na terceira etapa tira um print-screen da sua tela onde contem o banco de dados não relacional.


## Codigo .JSON

```js
{
    "paginaInicial": "www.google.com",
    "idiomaPreferido": "Português do Brasil",
    "localizacao": "São Paulo",
    "tema": "Clássico",
    "mostrarFavoritos": true,
    "zoom": 100
}
```
## Modelos Relacionais
### Funcionarios
![image](https://github.com/IsabelaQu/Banco-de-Dados/assets/124175141/a470ed06-56ef-4107-9b1f-ae1a74e6dd5c)

### Endereços
![image](https://github.com/IsabelaQu/Banco-de-Dados/assets/124175141/fa5c0ef9-46f3-4780-8f6b-89f1e12b360c)

### Emails
![image](https://github.com/IsabelaQu/Banco-de-Dados/assets/124175141/70580889-2dcf-4c39-9bbd-bf0fb7000968)

### Cargos
![image](https://github.com/IsabelaQu/Banco-de-Dados/assets/124175141/421cb83c-0ebe-4fe3-9347-1d02d63c9bc6)

## Documento JSON contendo os dados normalizados
```js
{
    "Funcionarios": [
        {
            "id": 1,
            "nome": "João Grilo",
            "endereco_id": 1,
            "cargo_id": 1,
            "jornada": 40,
            "salario": 3000.00
        },
        {
            "id": 2,
            "nome": "Ada Byron",
            "endereco_id": 2,
            "cargo_id": 2,
            "jornada": 20,
            "salario": 15000.00
        },
        {
            "id": 3,
            "nome": "Gerundino",
            "endereco_id": 3,
            "cargo_id": 3,
            "jornada": 44,
            "salario": 8000.00
        },
        {
            "id": 4,
            "nome": "Chicó",
            "endereco_id": 4,
            "cargo_id": 2,
            "jornada": 20,
            "salario": 15000.00
        }
    ],
    "Enderecos": [
        {
            "id": 1,
            "endereco": "Rua Suassuna, 30, João Pessoa, PB"
        },
        {
            "id": 2,
            "endereco": "Rua Lovelace, 67, London"
        },
        {
            "id": 3,
            "endereco": "Rua Substantivo, 78, Bairro Predicado, Mesóclise-AC"
        },
        {
            "id": 4,
            "endereco": "Rua Eurico, 50, João Pessoa, PB, Apt 28 Bloco C"
        }
    ],
    "Emails": [
        {
            "id": 1,
            "funcionario_id": 1,
            "email": "gilo@mail.com"
        },
        {
            "id": 2,
            "funcionario_id": 1,
            "email": "joaog@mk.com"
        },
        {
            "id": 3,
            "funcionario_id": 2,
            "email": "ada@mal.com"
        },
        {
            "id": 4,
            "funcionario_id": 2,
            "email": "abyron@tech.com"
        },
        {
            "id": 5,
            "funcionario_id": 3,
            "email": "gerundino@gmail.com"
        }
    ],
    "Cargos": [
        {
            "id": 1,
            "cargo": "Contador"
        },
        {
            "id": 2,
            "cargo": "Developer"
        },
        {
            "id": 3,
            "cargo": "Linguista"
        }
    ]
}
```
