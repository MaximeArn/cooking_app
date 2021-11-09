import { Router } from "express";
const {
  createGroup,
  getGroups,
  getGroupById,
} = require("../controllers/groups");

const groupsRouter = Router();

groupsRouter.post("/:connectedUser", createGroup);
groupsRouter.get("/getGroups/:connectedUser", getGroups);
groupsRouter.get("/:groupId", getGroupById);

export default groupsRouter;
