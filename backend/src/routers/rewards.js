"use strict";
exports.__esModule = true;
var express_1 = require("express");
var getRewards = require("../controllers/rewards").getRewards;
var rewardsRouter = (0, express_1.Router)();
rewardsRouter.get("/", getRewards);
exports["default"] = rewardsRouter;
