import { Router } from "express";
const { getRewards } = require("../controllers/reward");

const rewardRouter = Router();

rewardRouter.get("/", getRewards);

export default rewardRouter;
