import { Router } from "express";
const { createChallenge } = require("../controllers/challenges");

const challengesRouter = Router();

challengesRouter.post("/:groupId", createChallenge);

export default challengesRouter;
