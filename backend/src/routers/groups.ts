import { Router } from "express";
const { createGroup, getGroups } = require("../controllers/groups");

const groupsRouter = Router();

groupsRouter.post("/:connectedUser", createGroup);
groupsRouter.get("/:connectedUser", getGroups);

export default groupsRouter;
