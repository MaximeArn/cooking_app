"use strict";
exports.__esModule = true;
var express_1 = require("express");
var _a = require("../controllers/users"), getUsersByName = _a.getUsersByName, getUserByEmail = _a.getUserByEmail, getUserById = _a.getUserById, updateUser = _a.updateUser, getNationalRanking = _a.getNationalRanking, getFriendsByName = _a.getFriendsByName, createUser = _a.createUser, deleteUser = _a.deleteUser;
var usersRouter = (0, express_1.Router)();
usersRouter.get("/email/:email", getUserByEmail);
usersRouter.get("/id/:id", getUserById);
usersRouter.get("/search/:filter", getUsersByName);
//Maybe make an easyer path
usersRouter.get("/searchAmoungFriends/:filter/:connectedUserId", getFriendsByName);
usersRouter.get("/ranking/national/:countryCode", getNationalRanking);
usersRouter.post("", createUser);
usersRouter.patch("/:id", updateUser);
usersRouter["delete"]("/:id", deleteUser);
exports["default"] = usersRouter;
