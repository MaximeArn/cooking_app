"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const post_1 = __importDefault(require("../models/post"));
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
        new post_1.default({
            image: `http://localhost:${PORT}/assets/images/posts/dish_1.jpg`,
        }).save(),
        new post_1.default({
            image: `http://localhost:${PORT}/assets/images/posts/dish_2.jpg`,
        }).save(),
        new post_1.default({
            image: `http://localhost:${PORT}/assets/images/posts/dish_3.jpg`,
        }).save(),
        new post_1.default({
            image: `http://localhost:${PORT}/assets/images/posts/dish_4.jpg`,
        }).save(),
        new post_1.default({
            image: `http://localhost:${PORT}/assets/images/posts/dish_5.jpg`,
        }).save(),
        new post_1.default({
            image: `http://localhost:${PORT}/assets/images/posts/dish_6.jpg`,
        }).save(),
    ]).then((res) => {
        console.log("data installed");
        mongoose_1.default.connection.close();
    });
});
