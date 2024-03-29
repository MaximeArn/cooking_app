# **COOKING DOCUMENTATION**

# Project Architecture

Two folders at the root of the project:

- `backend` that contains all the nodeJs/express server

- `flutter` that contains all the flutter app

<blockquote>
 <h2> Backend </h2>

The backend folder contains lot of folders :

- `dist` is the outDirectory of the build (it contains the javascript code that is generated after a build).

- `models` is the folder that contains mongoose models and schemas.

- `public` contains static assets

- `src` contains the all code of the server

  - `server.ts` is the main file of the server with the config of the server and the connection to the database

  - `routers` contains all the routers. one per entity in the DB.

  - `controllers` is the biggest folder of the backend. it contains a file per entity in the database. Each controller contains all the methods that concern the entity. (CRUD method and more).

  - `utils` contains dunction that are used in different places in the server.

</blockquote>

<blockquote>
 <h2> Flutter </h2>

The flutter folder contains even more folders but only a few of them are interesting :

- `assets` contains static assets of the app

- `lib` contains all the code of the flutter app

  - `environment` is a folder with a unique file that contains urls of third-party services (AWS, api)

  - `models` contains models of each entity of the app. It describes properties, types, methodes and constructors. it is here that you can find method that convert a Json to an Object (named constructor `fromJson`) or the opposite (`yourInstanceObject.toJson`).

  - `providers` the providers folder also contains a file per entity. It is in the providers that I stored the state of my app (`connectedUser` in the `usersProvider` for example) and all the logical part of the app (`register` and `login` methods in the `authProvider` for example).

  - `views` contains all the UI of the app. There is a folder per view. In most of them you have a file that is the entire widget and a folder called `widgets`. This folder contains several widgets that compose the main widget.

  - `widgets` contains widgets used pretty much everywhere in cooking

  - `main.dart` is the most important file of the app. It contains the root widget, the configuration of all providers all routes and alll third-party services.

  - `themes.dart` contains CookingTheme that is a classe containing the dark and the light theme of the app

  - `utils.dart` is a class that contains usefull method (showSnackBar) and key that I need everywhere in the app

</blockquote>

# Scripts

There is a few scripts that you must know and understand to work on cooking:

<blockquote>
<h2>Build </h2>

In a first time after a major change you must compile the typescript version of your code in minified javascript.

`yarn build` start typescript compiler and follows rules dicted in the tscConfig (that defines the outDir the version...)

</blockquote>

<blockquote>
<h2>Deployment</h2>

When your code is built you must deploy the new version of the API (that you only have localy for the moment).
The Cooking API is hosted on heroku. if you look at git remotes in `backend` folder (git remote -v ) you can see a remote called "heroku". This remote repository is used to run the api. To deploy an ulterior version you need to push changes.

```sh

git add .
git commit -m"minor fixes on images update"
git push heroku master

```

</blockquote>

<blockquote>
<h2>Run API </h2>

The Cooking Api is hosted separately from the frontend.

To run the api go to the backend folder and start the dyno using the following command : `heroku ps:scale web=1 `

To stop this dyno run `heroku ps:scale web=0`

</blockquote>

<blockquote>
<h2>Config API</h2>

to run well the API need some env variables that must be set directly through the heroku CLI.
To see environment variable that are already defined type : `heroku config`.

```sh
maxime@MacBook-Maxime backend % heroku config

=== backend-cooking Config Vars
AWS_ACCESS_KEY_ID:     **********
AWS_SECRET_ACCESS_KEY: ********************************
DB_NAME:               ********
DB_PWD:                ************
DB_USERNAME:           ************
PAPERTRAIL_API_TOKEN:  **************
PORT:                  ******
```

If you need to pass a new value to an env variable you can use: `heroku config:set ENVVAR=value `

</blockquote>

# Error Handling

I tried to make an easy way to manage errors throught the app.

<blockquote>

<h2>Back</h2>

In the server I use express error middleware to handle each type of error.

<h2>Front</h2>

</blockquote>
