import { Router } from "express";
import multer from "multer";
const { addImage } = require("../controllers/images");

const fileFilter = (_, file, cb) => {
  if (file.mimetype === "image/jpeg" || file.mimetype === "image/jpg") {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const avatarsUpload = multer({
  storage: multer.memoryStorage(),
  fileFilter: fileFilter,
});

const imagesRouter = Router();

imagesRouter.post("/user/avatar", avatarsUpload.single("avatar"), addImage);

export default imagesRouter;
