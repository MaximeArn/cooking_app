import { Router } from "express";
const { getRewards } = require("../controllers/reward");

const rewardsRouter = Router();

rewardsRouter.get("/", getRewards);

export default rewardsRouter;
