import express, { urlencoded, json } from "express";
import mongoose from "mongoose";
import userRouter from "./routers/user";
import postRouter from "./routers/post";
import { config } from "dotenv";

config();
const server = express();
const PORT = process.env.PORT || 3000;
const DB_USERNAME = process.env.DB_USERNAME;
const DB_PWD = process.env.DB_PWD;
const DB_NAME = process.env.DB_NAME;

mongoose.set("debug", true);
mongoose.connect(
  `mongodb+srv://${DB_USERNAME}:${DB_PWD}@cluster0.elh3w.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`,
  {
    useUnifiedTopology: true,
    useNewUrlParser: true,
  }
);

server.use(urlencoded({ extended: true }));
server.use(json());

server.use(express.static(`${__dirname}/../public`));
server.use("/user", userRouter);
server.use("/post", postRouter);

server.get("/", (_, res) => {
  res.send("Hello worlld !");
});

server.listen(PORT, () => console.log(`server is listening on ${PORT}`));
