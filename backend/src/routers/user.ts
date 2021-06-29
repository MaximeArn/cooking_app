import { Router } from "express";
const { addUser } = require("../controllers/user");

const userRouter = Router();

userRouter.post("/", addUser);

export default userRouter;
