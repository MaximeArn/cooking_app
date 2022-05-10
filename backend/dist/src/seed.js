"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const dotenv_1 = require("dotenv");
const post_1 = __importDefault(require("../models/post"));
const reward_1 = __importDefault(require("../models/reward"));
const user_1 = __importDefault(require("../models/user"));
(0, dotenv_1.config)();
const PORT = process.env.PORT;
const DB_USERNAME = process.env.DB_USERNAME;
const DB_PWD = process.env.DB_PWD;
const DB_NAME = process.env.DB_NAME;
mongoose_1.default
    .connect(`mongodb+srv://${DB_USERNAME}:${DB_PWD}@cluster0.elh3w.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
    .then(() => {
    Promise.all([
        new user_1.default({
            name: "Djibril",
            email: "djibril@gmail.com",
            password: "Djibril",
            avatar: `http://localhost:${PORT}/assets/images/avatars/profile_photo_1.jpg`,
        }).save(),
        new user_1.default({
            name: "Gabriel",
            email: "gabriel@gmail.com",
            password: "Gabriel",
            avatar: `http://localhost:${PORT}/assets/images/avatars/profile_photo_5.jpg`,
        }).save(),
        new user_1.default({
            name: "Maxime",
            email: "maxime@gmail.com",
            password: "Maxime",
            avatar: `http://localhost:${PORT}/assets/images/avatars/profile_photo_4.jpg`,
        }).save(),
        new user_1.default({
            name: "Chloé",
            email: "chloé@gmail.com",
            password: "Chloé",
            avatar: `http://localhost:${PORT}/assets/images/avatars/profile_photo_2.jpg`,
        }).save(),
        new user_1.default({
            name: "Jade",
            email: "jade@gmail.com",
            password: "Jade",
            avatar: `http://localhost:${PORT}/assets/images/avatars/profile_photo_3.jpg`,
        }).save(),
        new user_1.default({
            name: "Anne",
            email: "anne@gmail.com",
            password: "Anne",
            avatar: `http://localhost:${PORT}/assets/images/avatars/profile_photo_6.jpg`,
        }).save(),
        new post_1.default({
            images: [
                `http://localhost:${PORT}/assets/images/posts/dish_1.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_1.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_1.jpg`,
            ],
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        }).save(),
        new post_1.default({
            images: [
                `http://localhost:${PORT}/assets/images/posts/dish_2.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_2.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_2.jpg`,
            ],
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor. ",
        }).save(),
        new post_1.default({
            images: [
                `http://localhost:${PORT}/assets/images/posts/dish_3.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_3.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_3.jpg`,
            ],
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor. ",
        }).save(),
        new post_1.default({
            images: [
                `http://localhost:${PORT}/assets/images/posts/dish_4.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_4.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_4.jpg`,
            ],
            description: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
        }).save(),
        new post_1.default({
            images: [
                `http://localhost:${PORT}/assets/images/posts/dish_5.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_5.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_5.jpg`,
            ],
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor. ",
        }).save(),
        new post_1.default({
            images: [
                `http://localhost:${PORT}/assets/images/posts/dish_6.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_6.jpg`,
                `http://localhost:${PORT}/assets/images/posts/dish_6.jpg`,
            ],
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor. ",
        }).save(),
        new reward_1.default({
            price: 15,
            title: " 20% on vegetables",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
            image: "assets/images/rewards/vegetables.jpg",
        }).save(),
        new reward_1.default({
            price: 10,
            title: " A free baguette for 2 purchased",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
            image: "assets/images/rewards/bakery.jpg",
        }).save(),
        new reward_1.default({
            price: 30,
            title: "10% on beef ",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
            image: "assets/images/rewards/meat.jpg",
        }).save(),
        new reward_1.default({
            price: 45,
            title: "15% on the whole shelf",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
            image: "assets/images/rewards/fish.jpeg",
        }).save(),
        new reward_1.default({
            price: 20,
            title: "A goat cheese offered for 30€ of purchase",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fermentum pharetra mauris vitae bibendum. Duis gravida tellus mauris, in fermentum massa pharetra non. Aliquam rhoncus faucibus mauris, a auctor nulla feugiat nec. Quisque sed pharetra lorem. Quisque egestas, odio a cursus cursus, lectus ipsum tristique odio, sit amet condimentum tortor.",
            image: "assets/images/rewards/cheese.jpg",
        }).save(),
    ]).then((res) => {
        console.log("data installed");
        mongoose_1.default.connection.close();
    });
});
