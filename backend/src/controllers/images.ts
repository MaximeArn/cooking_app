import { NextFunction, Response } from "express";
import fs from "fs";
import sharp from "sharp";
import Path from "path";

const imagesController = {
  isDefaultAvatar: (path: string) => {
    return path.includes("default_avatar.jpg");
  },

  uploadAvatar: async (
    { file: { filename, destination, path }, body: { oldAvatar } },
    res: Response,
    next: NextFunction
  ) => {
    try {
      // remove previous avatar
      const previousAvatarPath = oldAvatar.replace(
        "http://localhost:4545/",
        ""
      );
      const absolutePreviousAvatarPath = Path.resolve(
        "public",
        previousAvatarPath
      );

      !imagesController.isDefaultAvatar(absolutePreviousAvatarPath) &&
        fs.unlinkSync("public" + absolutePreviousAvatarPath);

      // compress new avatar
      const compressedFilename = `${filename.substring(
        0,
        filename.length - 4
      )}-compressed.jpg`;
      const compressedAvatarPath = Path.resolve(
        destination,
        compressedFilename
      );
      await sharp(path).resize(180, 180).toFile(compressedAvatarPath);

      // remove full size avatar
      fs.unlinkSync(Path.resolve(path));

      const newPath = `/assets/images/avatars/${compressedFilename}`;
      res.json(newPath).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  deleteImage: async (path: string, next: NextFunction) => {
    try {
      !imagesController.isDefaultAvatar(path) &&
        fs.unlinkSync(`public/${path}`);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};

module.exports = imagesController;
