import { Router } from "express";
import multer from "multer";
const { addImage, deleteImage } = require("../controllers/images");

const fileFilter = (_, file, cb) => {
  if (file.mimetype === "multipart/form-data") {
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

imagesRouter.post("/", avatarsUpload.single("avatar"), addImage);
imagesRouter.delete("/", deleteImage);

export default imagesRouter;
