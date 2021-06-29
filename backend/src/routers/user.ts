import { Router } from "express";
import user from "../../models/user";
const { getUserById } = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:userId", getUserById);

export default userRouter;
