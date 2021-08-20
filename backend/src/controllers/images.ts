import { Response } from "express";
import fs from "fs";

module.exports = {
  uploadAvatar: (
    { file: { filename }, body: { oldAvatar } },
    res: Response
  ) => {
    const path = `http://localhost:4545/assets/images/avatars/${filename}`;

    console.log(oldAvatar);
    console.log("OLD AVVATTARRR -----> ", oldAvatar);
    try {
      fs.unlinkSync(
        `../../assets/images/avatars/image_picker_A2FED644-7197-43E4-BA1D-FB427E3C7EAD-68182-00001F15F44C2616.jpg`
      );
      console.log("IMAGE DELETED !!!!!!");
    } catch (error) {
      console.log(error);
    }

    res.json(path).status(200);
  },
};
