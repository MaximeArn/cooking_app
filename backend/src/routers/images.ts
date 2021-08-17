import { Router } from "express";
const { uploadAvatar } = require("../controllers/images");

import multer from "multer";
const avatarsUpload = multer({
  dest: "public/assets/images/avatars",
});

const imagesRouter = Router();

imagesRouter.post("/user/avatar", avatarsUpload.single("avatar"), uploadAvatar);

export default imagesRouter;
