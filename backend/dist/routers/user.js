"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const userRouter = express_1.Router();
userRouter.post("/", (req, res, next) => {
    res.send("add user !");
});
exports.default = userRouter;
