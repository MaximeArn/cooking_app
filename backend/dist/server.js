"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const user_1 = __importDefault(require("./routers/user"));
const server = express_1.default();
const port = 3000;
server.use("/user", user_1.default);
server.get("/", (_, res) => {
    res.send("Hello world !");
});
server.listen(port, () => console.log(`server is listening on ${port}`));
