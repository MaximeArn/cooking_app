import { Router } from "express";
const {
  getUsersByName,
  getUserById,
  updateProfile,
  getNationalRanking,
} = require("../controllers/user");

const usersRouter = Router();

usersRouter.get("/:userId", getUserById);
usersRouter.get("/search/:filter", getUsersByName);
usersRouter.patch("/:userId", updateProfile);
usersRouter.get("/ranking/national/:countryCode", getNationalRanking);

export default usersRouter;
