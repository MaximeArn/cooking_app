import { Router } from "express";
const { createChallenge, insertPost } = require("../controllers/challenges");

const challengesRouter = Router();

challengesRouter.post("/:groupId", createChallenge);
challengesRouter.patch("/:challengeId", insertPost);

export default challengesRouter;
