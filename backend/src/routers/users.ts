import { Router } from "express";
const {
  getUsersByName,
  getUserById,
  updateProfile,
  getNationalRanking,
  getFriendsByName,
} = require("../controllers/users");

const usersRouter = Router();

usersRouter.get("/:userId", getUserById);
usersRouter.get("/search/:filter", getUsersByName);
usersRouter.get(
  "/searchAmoungFriends/:filter/:connectedUserId",
  getFriendsByName
);
usersRouter.get("/ranking/national/:countryCode", getNationalRanking);
usersRouter.post("");
usersRouter.patch("/:userId", updateProfile);

export default usersRouter;
