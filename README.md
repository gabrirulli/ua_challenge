# README

Setup applicazione:

* rails db:setup

* rails db:seed (vengono creati dei record che serviranno per il calcolo dei prezzi degli hotel)

* bundle exec sidekiq

Gli endpoint sono:

* "/hotels"

* "/session"

Per il login passare oggetto "session"

```
{
  "session": {
    "email": "admin@example.com",
    "password": "password"
  }
}
```
che ritornera un token ("remember_token") da poter utilizzare per l'autenticazione delle chiamate

```
{
    "id": 1,
    "created_at": "2018-03-15T15:37:11.393Z",
    "updated_at": "2018-03-15T15:37:11.393Z",
    "email": "admin@example.com",
    "encrypted_password": "$2a$10$eIRmnv6Ff11wzKeL6sJ7jeZGTD06qVTQhn1308fiBgLzzWSRaevB2",
    "confirmation_token": null,
    "remember_token": "66f1...",
    "first_name": "Gabriele",
    "last_name": "Rulli"
}
```
