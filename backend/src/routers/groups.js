"use strict";
exports.__esModule = true;
var express_1 = require("express");
var _a = require("../controllers/groups"), createGroup = _a.createGroup, getGroups = _a.getGroups, getGroupById = _a.getGroupById;
var groupsRouter = (0, express_1.Router)();
groupsRouter.post("/:connectedUser", createGroup);
groupsRouter.get("/getGroups/:connectedUser", getGroups);
groupsRouter.get("/:groupId", getGroupById);
exports["default"] = groupsRouter;
