"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const { createGroup, getGroups, getGroupById, } = require("../controllers/groups");
const groupsRouter = (0, express_1.Router)();
groupsRouter.post("/:connectedUser", createGroup);
groupsRouter.get("/getGroups/:connectedUser", getGroups);
groupsRouter.get("/:groupId", getGroupById);
exports.default = groupsRouter;
