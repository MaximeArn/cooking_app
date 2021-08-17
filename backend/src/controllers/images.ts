import { Response } from "express";

module.exports = {
  uploadAvatar: ({ file: { originalName } }, res: Response) => {
    const path = `http://localhost/public/assets/images/avatars/${originalName}`;
    res.send(path).status(200);
  },
};
