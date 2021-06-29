import express from "express";

const server = express();
const port = 3000;

server.get("/", (_, res) => {
  res.send("Hello world !");
});

server.listen(port, () => console.log(`server is listening on ${port}`));
