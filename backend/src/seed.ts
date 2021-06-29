import mongoose from "mongoose";
import { config } from "dotenv";
import Post from "../models/post";

config();
const PORT = process.env.PORT;
const DB_USERNAME = process.env.DB_USERNAME;
const DB_PWD = process.env.DB_PWD;
const DB_NAME = process.env.DB_NAME;

mongoose
  .connect(
    `mongodb+srv://${DB_USERNAME}:${DB_PWD}@cluster0.elh3w.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`,
    {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    }
  )
  .then(() => {
    Promise.all([
      new Post({
        image: `http://localhost:${PORT}/assets/images/posts/dish_1.jpg`,
      }).save(),
      new Post({
        image: `http://localhost:${PORT}/assets/images/posts/dish_2.jpg`,
      }).save(),
      new Post({
        image: `http://localhost:${PORT}/assets/images/posts/dish_3.jpg`,
      }).save(),
      new Post({
        image: `http://localhost:${PORT}/assets/images/posts/dish_4.jpg`,
      }).save(),
      new Post({
        image: `http://localhost:${PORT}/assets/images/posts/dish_5.jpg`,
      }).save(),
      new Post({
        image: `http://localhost:${PORT}/assets/images/posts/dish_6.jpg`,
      }).save(),
    ]).then((res) => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
