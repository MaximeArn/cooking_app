import express, { urlencoded, json } from "express";
import mongoose from "mongoose";
import userRouter from "./routers/user";
import postRouter from "./routers/post";
import rewardRouter from "./routers/reward";
import imagesRouter from "./routers/images";
import { config } from "dotenv";

import fs from "fs";

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
server.use("/users", userRouter);
server.use("/posts", postRouter);
server.use("/rewards", rewardRouter);
server.use("/images", imagesRouter);

console.log(__dirname);
const resolvedPath = fs.realpathSync(
  "public/assets/images/avatars/image_picker_6EB4142E-553E-430F-A664-2872B366C982-68182-00002D2A9556EEB1.jpg"
);
console.log(resolvedPath);

fs.unlinkSync(resolvedPath);

server.listen(PORT, () => console.log(`server is listening on ${PORT}`));
