"use strict";
exports.__esModule = true;
var express_1 = require("express");
var _a = require("../controllers/challenges"), createChallenge = _a.createChallenge, insertPost = _a.insertPost;
var challengesRouter = (0, express_1.Router)();
challengesRouter.post("/:groupId", createChallenge);
challengesRouter.patch("/:challengeId", insertPost);
exports["default"] = challengesRouter;
