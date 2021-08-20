import { Response } from "express";
import fs from "fs";
import sharp from "sharp";

module.exports = {
  uploadAvatar: (
    { file: { filename, destination, path }, body: { oldAvatar } },
    res: Response
  ) => {
    const previousAvatarPath = oldAvatar.replace("http://localhost:4545/", "");

    const absolutePreviousAvatarPath = fs.realpathSync(
      `public/${previousAvatarPath}`
    );
    fs.unlinkSync(absolutePreviousAvatarPath);

    // _____________________________________________________ //

    const nameWithoutExtension = filename.substring(0, filename.length - 4);
    try {
      const compressedAvatarPath = `${destination}/${nameWithoutExtension}-compressed.jpg`;
      sharp(path).jpeg({ quality: 30 }).toFile(compressedAvatarPath);

      // REMOVE THE FULL SIZE AVATAR AFTER
      // TRY TO SIMPLIFY THE CODE
    } catch (error) {
      console.log(error);
    }
    const newPath = `http://localhost:4545/assets/images/avatars/${nameWithoutExtension}-compressed.jpg`;
    res.json(newPath).status(200);
  },
};
