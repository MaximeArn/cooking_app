import { Response } from "express";
import fs from "fs";

module.exports = {
  uploadAvatar: ({ file: { filename }, body }, res: Response) => {
    const path = `http://localhost:4545/assets/images/avatars/${filename}`;
    console.log(body);
    res.json(path).status(200);
  },
};
