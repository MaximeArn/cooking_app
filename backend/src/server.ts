import express from "express";
import mongoose from "mongoose";
import { config } from "dotenv";
import userRouter from "./routers/user";

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
console.log(__dirname);

server.use(express.static(`${__dirname}/../public`));
server.use("/user", userRouter);

server.get("/", (_, res) => {
  res.send("Hello world !!!");
});

server.listen(PORT, () => console.log(`server is listening on ${PORT}`));
