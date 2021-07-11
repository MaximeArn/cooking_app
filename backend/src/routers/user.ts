import { Router } from "express";
const { getUsersByName, getUserById } = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:userId", getUserById);
userRouter.get("/search/:filter", getUsersByName);

export default userRouter;
