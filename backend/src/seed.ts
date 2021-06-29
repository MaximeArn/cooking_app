import mongoose from "mongoose";
import { config } from "dotenv";
import Post from "../models/post";
import Reward from "../models/reward";

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
      new Reward({
        price: 15,
        title: " 20% on vegetables",
        description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        image: "assets/images/rewards/vegetables.jpg",
      }).save(),
      new Reward({
        price: 10,
        title: " A free baguette for 2 purchased",
        description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        image: "assets/images/rewards/bakery.jpg",
      }).save(),
      new Reward({
        price: 30,
        title: "10% on beef ",
        description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        image: "assets/images/rewards/meat.jpg",
      }).save(),
      new Reward({
        price: 45,
        title: "15% on the whole shelf",
        description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        image: "assets/images/rewards/fish.jpeg",
      }).save(),
      new Reward({
        price: 20,
        title: "A goat cheese offered for 30€ of purchase",
        description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        image: "assets/images/rewards/cheese.jpg",
      }).save(),
    ]).then((res) => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
