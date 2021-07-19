import { Router } from "express";
const {
  getUsersByName,
  getUserById,
  updateProfile,
} = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:userId", getUserById);
userRouter.get("/search/:filter", getUsersByName);
userRouter.patch("/:userId", updateProfile);

export default userRouter;
