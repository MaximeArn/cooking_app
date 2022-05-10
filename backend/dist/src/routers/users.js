"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const { getUsersByName, getUserByEmail, getUserById, updateUser, getNationalRanking, getFriendsByName, createUser, deleteUser, } = require("../controllers/users");
const usersRouter = (0, express_1.Router)();
usersRouter.get("/email/:email", getUserByEmail);
usersRouter.get("/id/:id", getUserById);
usersRouter.get("/search/:filter", getUsersByName);
//Maybe make an easyer path
usersRouter.get("/searchAmoungFriends/:filter/:connectedUserId", getFriendsByName);
usersRouter.get("/ranking/national/:countryCode", getNationalRanking);
usersRouter.post("", createUser);
usersRouter.patch("/:id", updateUser);
usersRouter.delete("/:id", deleteUser);
exports.default = usersRouter;
