# COOKING DOCUMENTATION

<blockquote>

<h1>Project Architecture</h1>

Two folders at the root of the project:

--> `backend` that contains all the nodeJs/express server

--> `flutter` that contains all the flutter app

<blockquote>
 <h2> Backend </h2>

The backend folder contains lot of folders :

--> `dist` is the outDirectory of the build (it contains the javascript code that is generated after a build).

--> `models` is the folder that contains mongoose models and schemas.

--> `public` contains static assets

--> `src` contains the all code of the server

<blockquote>

 <h2> src </h2>

--> `server.ts` is the main file of the server with the config of the server and the connection to the database

--> `routers` contains all the routers. one per entity in the DB.

--> `controllers` is the biggest folder of the backend. it contains a file per entity in the database. Each controller contains all the methods that concern the entity. (CRUD method and more).

--> `utils` contains dunction that are used in different places in the server.

</blockquote>
<blockquote>
 
</blockquote>

</blockquote>
<blockquote>
 <h2> Flutter </h2>

The flutter folder contains even more folders but only a few of them are interesting
-->

</blockquote>

<blockquote>
<h1>Scripts</h1>

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
<h2>Run Api </h2>

The Cooking Api is hosted separately from the frontend.

</blockquote>

</blockquote>
