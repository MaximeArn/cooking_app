import { Router } from "express";
const {
  getUsersByName,
  getUserByEmail,
  getUserById,
  updateProfile,
  getNationalRanking,
  getFriendsByName,
  createUser,
} = require("../controllers/users");

const usersRouter = Router();

usersRouter.get("/email/:email", getUserByEmail);
usersRouter.get("/id/:id", getUserById);
usersRouter.get("/search/:filter", getUsersByName);
// Maybe make an easyer path
usersRouter.get(
  "/searchAmoungFriends/:filter/:connectedUserId",
  getFriendsByName
);
usersRouter.get("/ranking/national/:countryCode", getNationalRanking);
usersRouter.post("", createUser);
usersRouter.patch("/:userId", updateProfile);

export default usersRouter;
