import { Router } from "express";
const { getUsersByName, addUser } = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:filter", getUsersByName);

export default userRouter;
