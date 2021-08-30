import { Router } from "express";
const {
  getUsersByName,
  getUserById,
  updateProfile,
  getNationalRanking,
} = require("../controllers/user");

const userRouter = Router();

userRouter.get("/:userId", getUserById);
userRouter.get("/search/:filter", getUsersByName);
userRouter.patch("/:userId", updateProfile);
userRouter.get("/ranking/:country", getNationalRanking);

export default userRouter;
