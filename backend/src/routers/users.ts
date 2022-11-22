import { Router } from "express";
const {
  getUsersByName,
  getUserByEmail,
  getUserById,
  updateUser,
  getNationalRanking,
  getFriendsByName,
  createUser,
  deleteUser,
} = require("../controllers/users");

const usersRouter: any = Router();

usersRouter.get("/email/:email", getUserByEmail);
usersRouter.get("/id/:id", getUserById);
usersRouter.get("/search/:filter", getUsersByName);
//Maybe make an easyer path
usersRouter.get(
  "/searchAmoungFriends/:filter/:connectedUserId",
  getFriendsByName
);
usersRouter.get(
  "/ranking/national/:countryCode/:connectedUserStars",
  getNationalRanking
);
usersRouter.post("", createUser);
usersRouter.patch("/:id", updateUser);
usersRouter.delete("/:id", deleteUser);

export default usersRouter;
