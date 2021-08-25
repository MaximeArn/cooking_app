import { Response } from "express";
import fs from "fs";
import sharp from "sharp";
import Path from "path";

module.exports = {
  uploadAvatar: async (
    { file: { filename, destination, path }, body: { oldAvatar } },
    res: Response
  ) => {
    const previousAvatarPath = oldAvatar.replace("http://localhost:4545/", "");
    const absolutePreviousAvatarPath = Path.resolve(
      "public",
      previousAvatarPath
    );
    fs.unlinkSync(absolutePreviousAvatarPath);

    const compressedFilename = `${filename.substring(
      0,
      filename.length - 4
    )}-compressed.jpg`;
    const compressedAvatarPath = Path.resolve(destination, compressedFilename);
    console.log(compressedAvatarPath);
    await sharp(path).resize(180, 180).toFile(compressedAvatarPath);

    fs.unlinkSync(Path.resolve(path));

    const newPath = `http://localhost:4545/assets/images/avatars/${compressedFilename}`;
    res.json(newPath).status(200);
  },
};
