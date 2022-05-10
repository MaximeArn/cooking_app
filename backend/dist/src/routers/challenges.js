"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const { createChallenge, insertPost } = require("../controllers/challenges");
const challengesRouter = (0, express_1.Router)();
challengesRouter.post("/:groupId", createChallenge);
challengesRouter.patch("/:challengeId", insertPost);
exports.default = challengesRouter;
