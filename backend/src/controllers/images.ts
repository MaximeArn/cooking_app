import { Response } from "express";
import fs from "fs";

module.exports = {
  uploadAvatar: (
    { file: { filename }, body: { oldAvatar } },
    res: Response
  ) => {
    const previousAvatarPath = oldAvatar.replace("http://localhost:4545/", "");

    const absolutePreviousAvatarPath = fs.realpathSync(
      `public/${previousAvatarPath}`
    );
    fs.unlinkSync(absolutePreviousAvatarPath);

    const path = `http://localhost:4545/assets/images/avatars/${filename}`;
    res.json(path).status(200);
  },
};
