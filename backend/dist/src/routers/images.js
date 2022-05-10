"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const multer_1 = __importDefault(require("multer"));
const { uploadAvatar } = require("../controllers/images");
var storage = multer_1.default.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "public/assets/images/avatars");
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    },
});
var avatarsUpload = (0, multer_1.default)({
    storage,
});
const imagesRouter = (0, express_1.Router)();
imagesRouter.post("/user/avatar", avatarsUpload.single("avatar"), uploadAvatar);
exports.default = imagesRouter;
