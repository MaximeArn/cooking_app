"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const aws_sdk_1 = __importDefault(require("aws-sdk"));
const s3 = new aws_sdk_1.default.S3();
const imagesController = {
    isDefaultAvatar: (path) => {
        return path.includes("default_avatar.jpg");
    },
    getKeyFromPath: (path) => {
        const partsOfPath = path.split("/");
        const fileName = partsOfPath[partsOfPath.length - 1];
        return fileName;
    },
    addImage: (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { file } = req;
            yield imagesController.deleteImage(req, res, next);
            const s3Params = {
                Bucket: process.env.AWS_BUCKET_NAME,
                Key: file.originalname,
                Body: file.buffer,
                ACL: "public-read-write",
                ContentType: "image/jpeg",
            };
            s3.upload(s3Params, (err, data) => {
                if (err) {
                    throw new Error(err.message);
                }
                else {
                    return res.json(data.key).status(200);
                }
            });
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    deleteImage: ({ body: { oldAvatar } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const previousAvatarWasDefault = imagesController.isDefaultAvatar(oldAvatar);
            if (previousAvatarWasDefault)
                return;
            const s3params = {
                Bucket: process.env.AWS_BUCKET_NAME,
                Key: imagesController.getKeyFromPath(oldAvatar),
            };
            s3.deleteObject(s3params, (err) => {
                if (err) {
                    throw new Error(err.message);
                }
                else {
                    console.log(`${s3params.Key} image has been deleted `);
                    if (previousAvatarWasDefault)
                        return res.send().status(200);
                }
            });
            if (previousAvatarWasDefault)
                res.end();
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
module.exports = imagesController;
