"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const { addUser } = require("../controllers/user");
const userRouter = express_1.Router();
userRouter.post("/", addUser);
exports.default = userRouter;
