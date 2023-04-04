# GamIng API :space_invader:

Te damos la bienvenida a la API de GamIng.

GamIng es un centro de juegos donde se pueden jugar diferentes juegos, obtener monedas y ver rankings.

Esta es la API que permite la conexión con el `frontend` desarrollado en `Unity`, que se encuentra en otro repositorio. Para entender mejor la modelación, puedes ver los diagramas que modelan el centro de juegos en `/docs`.

Documentación parcial disponible [aquí](https://documenter.getpostman.com/view/17856787/UyxojQCf).

## Setup local:

Para utilizar la API debes seguir los siguientes pasos, recuerda adaptarlos para tu sistema operativo. 

1. Instalar rvm: 
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
```
2. Instalar Ruby 2.6.3 y Rails 6.0.5:
```
rvm install 2.6.3
gem install rails -v 6.0.5
```
3. Clonar el repositorio
```
git clone https://github.com/IIC2113/proyecto-grupo26-backend.git
```
4. Instalar dependencias

```
bundle install
```

5. En `config/database.yml` poner lo siguiente:
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  username: gaming
  password: <%= ENV['GAMING_PASSWORD'] %>
  pool: 5

production:
  <<: *default
  database: gamIng_production

development:
  <<: *default
  database: gamIng_development

test:
  <<: *default
  database: gamIng_test

```
6. Crear un usuario en postgresql con permiso para crear una base de datos:
```
psql postgres
```
```
CREATE USER 'gaming' WITH ENCRYPTED PASSWORD '<contraseña>'
ALTER USER 'gaming' CREATE DB;
```
7. Crear bases de datos
```
rails db:create
```
8. Correr migraciones
```
rails db:migrate
```
9. Correr seeds
```
rails db:seed
```
10. Agregar un archivo de entorno y escribir lo siguiente (según contraseña del paso 5):
```
GAMING_PASSWORD=<contraseña>
```
En caso que tengas problemas para hacer funcionar el archivo de entorno, recomendamos escribir la contraseña directamente en el archivo `database.yml`

11. Correr la API
```
rails s
```

Para jugar, puedes crear un usuario nuevo o utilizar alguno ya existente (ej: dani, fossa, jack, jorge), viendo sus credenciales en el archivo seeds.

:rocket: ¡A disfrutar!

