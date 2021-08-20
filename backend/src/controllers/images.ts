import { Response } from "express";
import fs from "fs";

module.exports = {
  uploadAvatar: (
    { file: { filename }, body: { oldAvatar } },
    res: Response
  ) => {
    const path = `http://localhost:4545/assets/images/avatars/${filename}`;

    const previousFileName = oldAvatar.replace(
      "http://localhost:4545/assets/images/avatars/",
      ""
    );
    console.log(previousFileName);

    try {
      const resolvedPath = fs.realpathSync(
        `public/assets/images/avatars/${previousFileName}`
      );
      fs.unlinkSync(resolvedPath);
      console.log("PREVIOUS AVATAR DELETED !!");
    } catch (error) {
      console.log(error);
    }

    res.json(path).status(200);
  },
};
