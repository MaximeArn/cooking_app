# COOKING DOCUMENTATION

<blockquote>
<h1>Scripts</h1>

<blockquote>
<h2>Build </h2>

In a first time after a major change you must compile the typescript version of your code in minified javascript.

`tsc` start typescript compiler and follows rules dicted in the tscConfig (that defines the outDir the version...)

</blockquote>

<blockquote>
<h2>Deployment</h2>

In a first time after a major change you must compile the typescript version of your code in a minified javascript version.

`tsc` start typescript compiler and follows rules dicted in the tscConfig (that defines the outDir the version...)

</blockquote>
</blockquote>

## Project Architecture

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

</blockquote>
