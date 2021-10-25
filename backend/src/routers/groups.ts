import { Router } from "express";
const { createGroup } = require("../controllers/groups");

const groupsRouter = Router();

groupsRouter.post("/:connectedUser", createGroup);

export default groupsRouter;
