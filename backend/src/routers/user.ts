import { Router } from "express";
const { getUserById } = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:userId", getUserById);

export default userRouter;
