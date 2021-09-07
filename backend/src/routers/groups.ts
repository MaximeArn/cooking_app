import { Router } from "express";
const { createGroup } = require("../controllers/groups");

const groupsRouter = Router();

groupsRouter.post("", createGroup);

export default groupsRouter;
