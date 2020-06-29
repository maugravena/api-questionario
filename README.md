# API para questionários

- Versão do ruby -
  `ruby 2.7.1`

- Inicialização do bando de dados -
  `bin/setup`

- Como rodar o setup de testes -
  `bundle exec rspec`

## Observações

- Adicionei uma rota para criação de questões, onde também é possível criar as
  respostas. Para isso utilizei Nested Attributes.

- Acrescentei validação para todos os campos dos models

## Dúvidas

- Inicialmente não fiz uso de shallow nesting, e tive alguns problemas depois
  de sua implementação, no momento em que `questions` ficou no bloco resources
  de `quizzes` tive que continuar passando o id do quiz para `questions` em `params`
  no teste(não apenas na url, como na rota POST de quiz recebe o id de user),
  pois sem ele (quiz_id), o método `question_params` não reconhecia o id vindo
  da url (ex: /api/v1/questionario/**:quiz_id**/questao).

- Na tradução das mensagens de erro não consegui traduzir os models e atributos

## Rotas

Exemplos de requisições para criação dos objetos

`POST /api/v1/usuario`

```json
{
  "name": "Mauricio",
  "email": "mau@email.com"
}
```

`POST /api/v1/usuario/user_id/questionario`

```json
{
  "name": "Questionário 1",
  "description": "Descrição do questionário",
  "limit_time": 10
}
```

`POST /api/v1/questionario/:quiz_id/questao`

```json
{
  "question": {
    "description": "Descrição da questão",
    "pontos": 5,
    "answers_attributes": [
      {
        "description": "Descrição resposta 1",
        "correct": false
      },
      {
        "description": "Descrição resposta 2",
        "correct": true
      }
    ]
  }
}
```
