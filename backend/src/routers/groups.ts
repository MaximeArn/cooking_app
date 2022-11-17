import { Router } from "express";
import multer from "multer";

const { createGroup } = require("../controllers/groups");

const avatarUpload = multer({
  storage: multer.memoryStorage(),
});

const groupsRouter = Router();

groupsRouter.post("/:id", avatarUpload.single("avatar"), createGroup);

export default groupsRouter;
