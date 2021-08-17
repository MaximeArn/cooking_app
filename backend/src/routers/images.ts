import { Router } from "express";
const { uploadAvatar } = require("../controllers/images");

const imagesRouter = Router();

imagesRouter.post("/user/avatar", uploadAvatar);

export default imagesRouter;
