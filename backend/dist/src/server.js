"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const mongoose_1 = __importDefault(require("mongoose"));
const dotenv_1 = require("dotenv");
const user_1 = __importDefault(require("./routers/user"));
dotenv_1.config();
const server = express_1.default();
const PORT = process.env.PORT || 3000;
const DB_USERNAME = process.env.DB_USERNAME;
const DB_PWD = process.env.DB_PWD;
const DB_NAME = process.env.DB_NAME;
mongoose_1.default.set("debug", true);
mongoose_1.default.connect(`mongodb+srv://${DB_USERNAME}:${DB_PWD}@cluster0.elh3w.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`, {
    useUnifiedTopology: true,
    useNewUrlParser: true,
});
console.log(__dirname);
server.use(express_1.default.static(`${__dirname}/../public`));
server.use("/user", user_1.default);
server.get("/", (_, res) => {
    res.send("Hello world !!!");
});
server.listen(PORT, () => console.log(`server is listening on ${PORT}`));
