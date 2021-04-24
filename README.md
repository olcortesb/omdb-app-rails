# omdb-app-rails

Aplicacion de busqueda de peliculas utilizando como fuente la api: http://www.omdbapi.com, permite la busqueda por nombre y por año; 
ofrece un panel de metricas.

## Comenzando 🚀

Demo de la Aplicacion



[![Watch the video](https://img.youtube.com/vi/eWz2GJKQKGc/3.jpg)](https://youtu.be/j1mOr7-5sJM)



### Arquitectura ⛺

Arquitectura MVC provista por el framework Rails

### Pre-requisitos 📋🔧

ruby
```
$ruby --version
ruby 3.0.0p0
```

rails
```
$rails --version
Rails 6.0.3.6
```
postgres
```
$postgres --version
postgres (PostgreSQL) 13.2
```

⛵ **Lanzar la aplicacion localmente** 
```
$bundle install
$rails db:migrate
$rails server
```

## Ejecutando las pruebas ⚙️
```
rspec
```


## Despliegue 📦

La aplicacion se desplego para su prueba y validacion en Heroku (https://www.heroku.com/)

Para deplegar en Heroku Teniendo una cuenta en Heroku , ejecutar los siguientes comandos:
```
#Loguearce en Heroku
$heroku login

#Crear aplicacion en Heroku
$heroku create

#Verificar que el repositorio de Heroku esta agregado
$git config --list --local | grep heroku

#Publicando la aplicacion
$git push heroku main

#Corriendo las migraciones en el servidor de Heroku
$heroku run rake db:migrate

#Verificando que esta corriendo la aplicacion
$heroku ps

#Abriendo la pagina donde esta deployada la aplicacion
$heroku open

```
## Construido con 🛠️

- Desarrollador en Rails 6.0.0
- Ruby 3.0.0

💎  **Dependencias / gemas**

- [Device](https://rubygems.org/gems/devise/versions/4.2.0?locale=es) : Para Login y gestion de usarios
- [Rspec](https://rubygems.org/gems/rspec): Testing
- [excon](https://rubygems.org/gems/excon): Cliente Api
- [ruby-debug-ide](https://rubygems.org/gems/ruby-debug-ide): Debug


## Autor ✒️

Oscar Cortes @olcortesb

## Licencia 📄

Este proyecto está bajo la Licencia MIT

## Agradecimiento 🎁

Como siempre... a la familia!
Por prestarme tiempo de su tiempo!

---