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

    // console.log(Path.resolve(destination));
    // await sharp(path).resize(180, 180).toFile(Path.resolve(destination, ));

    const newPath = `http://localhost:4545/assets/images/avatars/${filename}`;
    res.json(newPath).status(200);
  },
};
