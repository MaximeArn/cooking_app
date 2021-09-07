import { Router } from "express";
const { getRewards } = require("../controllers/rewards");

const rewardsRouter = Router();

rewardsRouter.get("/", getRewards);

export default rewardsRouter;
