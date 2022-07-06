"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const multer_1 = __importDefault(require("multer"));
const { addImage, deleteImage } = require("../controllers/images");
const fileFilter = (_, file, cb) => {
    if (file.mimetype === "multipart/form-data") {
        cb(null, true);
    }
    else {
        cb(null, false);
    }
};
const avatarsUpload = (0, multer_1.default)({
    storage: multer_1.default.memoryStorage(),
    fileFilter: fileFilter,
});
const imagesRouter = (0, express_1.Router)();
imagesRouter.post("/", avatarsUpload.single("avatar"), addImage);
imagesRouter.delete("/", deleteImage);
exports.default = imagesRouter;
