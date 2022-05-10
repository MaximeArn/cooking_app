"use strict";
exports.__esModule = true;
var express_1 = require("express");
var multer_1 = require("multer");
var uploadAvatar = require("../controllers/images").uploadAvatar;
var storage = multer_1["default"].diskStorage({
    destination: function (req, file, cb) {
        cb(null, "public/assets/images/avatars");
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
});
var avatarsUpload = (0, multer_1["default"])({
    storage: storage
});
var imagesRouter = (0, express_1.Router)();
imagesRouter.post("/user/avatar", avatarsUpload.single("avatar"), uploadAvatar);
exports["default"] = imagesRouter;
