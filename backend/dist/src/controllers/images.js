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
const fs_1 = __importDefault(require("fs"));
const sharp_1 = __importDefault(require("sharp"));
const path_1 = __importDefault(require("path"));
const imagesController = {
    isDefaultAvatar: (path) => {
        return path.includes("default_avatar.jpg");
    },
    uploadAvatar: ({ file: { filename, destination, path }, body: { oldAvatar } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            // remove previous avatar
            const previousAvatarPath = oldAvatar.replace("http://localhost:4545/", "");
            const absolutePreviousAvatarPath = path_1.default.resolve("public", previousAvatarPath);
            !imagesController.isDefaultAvatar(absolutePreviousAvatarPath) &&
                fs_1.default.unlinkSync("public" + absolutePreviousAvatarPath);
            // compress new avatar
            const compressedFilename = `${filename.substring(0, filename.length - 4)}-compressed.jpg`;
            const compressedAvatarPath = path_1.default.resolve(destination, compressedFilename);
            yield (0, sharp_1.default)(path).resize(180, 180).toFile(compressedAvatarPath);
            // remove full size avatar
            fs_1.default.unlinkSync(path_1.default.resolve(path));
            const newPath = `/assets/images/avatars/${compressedFilename}`;
            res.json(newPath).status(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    deleteImage: (path, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            !imagesController.isDefaultAvatar(path) &&
                fs_1.default.unlinkSync(`public/${path}`);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
module.exports = imagesController;
