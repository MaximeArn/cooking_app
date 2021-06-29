import express from "express";
import userRouter from "./routers/user";

const server = express();
const port = 3000;

server.use("/user", userRouter);

server.get("/", (_, res) => {
  res.send("Hello world !!!");
});

server.listen(port, () => console.log(`server is listening on ${port}`));
