"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const { getRewards } = require("../controllers/rewards");
const rewardsRouter = (0, express_1.Router)();
rewardsRouter.get("/", getRewards);
exports.default = rewardsRouter;
