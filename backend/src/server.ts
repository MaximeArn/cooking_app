import express, { urlencoded, json } from "express";
import mongoose from "mongoose";
import usersRouter from "./routers/users";
import postsRouter from "./routers/posts";
import rewardsRouter from "./routers/rewards";
import imagesRouter from "./routers/images";
import groupsRouter from "./routers/groups";
import { config } from "dotenv";
import challengesRouter from "./routers/challenges";
import AWS from "aws-sdk";

config();
const server = express();

const { PORT, DB_USERNAME, DB_PWD, DB_NAME } = process.env;

mongoose.set("debug", true);
try {
  mongoose.connect(
    `mongodb+srv://${DB_USERNAME}:${DB_PWD}@cooking.0otqxhb.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`,
    {
      useUnifiedTopology: true,
      useNewUrlParser: true,
    }
  );
} catch (error) {
  console.error(error);
}

AWS.config.getCredentials((err) => err && console.log(err.stack));

server.use(urlencoded({ extended: true }));
server.use(json());

server.use(express.static(`${__dirname}/../public`));
server.use("/users", usersRouter);
server.use("/posts", postsRouter);
server.use("/images", imagesRouter);
server.use("/groups", groupsRouter);
server.use("/challenges", challengesRouter);

server.listen(PORT || 3000, () =>
  console.log(`server is listening on ${PORT}`)
);
