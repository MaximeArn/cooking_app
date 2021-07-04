import { Router } from "express";
const { getUserById, getUsersByName } = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:filter", getUsersByName);
// userRouter.get("/:userId", getUserById);

export default userRouter;
