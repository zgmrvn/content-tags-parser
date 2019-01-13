## Project setup

Build l'image Ruby on Rails avec toutes les gems
```
docker-compose build
```

Migre la base de données et ajoute des entrées par défaut
```
docker-compose run --rm web rails db:create db:migrate db:setup
```

démarre le conteneur `web` et `postgresql`
```
docker-compose up
```
