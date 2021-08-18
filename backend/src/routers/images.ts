import { Router } from "express";
import multer from "multer";
import path from "path";
const { uploadAvatar } = require("../controllers/images");

const subpath = "/public/assets/images/activities";

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "public/assets/images/avatars");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

var avatarsUpload = multer({
  storage,
});

const imagesRouter = Router();

imagesRouter.post("/user/avatar", avatarsUpload.single("avatar"), uploadAvatar);

export default imagesRouter;
