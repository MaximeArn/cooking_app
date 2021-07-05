import { Router } from "express";
const { getUsersByName, addUser } = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:filter", getUsersByName);
userRouter.post("", addUser);

export default userRouter;
