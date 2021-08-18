import { Response } from "express";

module.exports = {
  uploadAvatar: ({ file: { filename } }, res: Response) => {
    const path = `http://localhost/public/assets/images/avatars/${filename}`;
    res.json(path).status(200);
  },
};
