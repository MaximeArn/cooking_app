import { Router } from "express";
import multer from "multer";

const { createGroup, createChallenge } = require("../controllers/groups");

const avatarUpload = multer({
  storage: multer.memoryStorage(),
});

const groupsRouter = Router();

groupsRouter.post("/:id", avatarUpload.single("avatar"), createGroup);
groupsRouter.patch("/challenge", createChallenge);

export default groupsRouter;
