# omdb-app-rails

Aplicacion de busqueda de peliculas utilizando como fuente la api: http://www.omdbapi.com, permite la busqueda por nombre y por año; 
ofrece un panel de metricas.

## Comenzando 🚀

Demo de la Aplicación (Web)



[![Watch the video](https://img.youtube.com/vi/eWz2GJKQKGc/3.jpg)](https://youtu.be/j1mOr7-5sJM)

Demo de la Aplicación (Responsive)


[![Watch the video](https://img.youtube.com/vi/goVMTUtG4gA/3.jpg)](https://youtu.be/goVMTUtG4gA)


### Arquitectura ⛺

Arquitectura MVC provista por el framework Rails

### Pre-requisitos 📋🔧

ruby
``` bash
$ruby --version
ruby 3.0.0p0
```

rails
``` bash
$rails --version
Rails 6.0.3.6
```
postgres
``` bash
$postgres --version
postgres (PostgreSQL) 13.2
```

⛵ **Lanzar la aplicacion localmente** 
``` bash
$bundle install
$rails db:migrate
$rails server
```

## Ejecutando las pruebas ⚙️

El primer paso es crear la base de test

``` bash
rails db:migrate RAILS_ENV=test
```

para ejecutar las pruebas es necesario agregar datos a la base
no estas mokeados los datos por que no esta corriendo en un entorno de integracion continua

``` bash
$rake spec
.............

Finished in 0.51705 seconds (files took 2.64 seconds to load)
13 examples, 0 failures
```


## Despliegue 📦

La aplicacion se desplego para su prueba y validacion en Heroku (https://www.heroku.com/)

Para deplegar en Heroku Teniendo una cuenta en Heroku , ejecutar los siguientes comandos:
``` bash
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
Para actualizar la aplicacion ya publicada
``` bash
$git push heroku main

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

Oscar Cortes [@olcortesb](https://github.com/olcortesb) 

## Licencia 📄

Este proyecto está bajo la Licencia [MIT](LICENSE)

## Agradecimiento 🎁

Como siempre... a la familia!
Por prestarme tiempo de su tiempo!

---