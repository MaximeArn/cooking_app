import { Response } from "express";

module.exports = {
  uploadAvatar: ({ file: { originalname } }, res: Response) => {
    const path = `http://localhost/public/assets/images/avatars/${originalname}`;
    res.json(path).status(200);
  },
};

//not the same name beetween the uploaded file name and the url returned by the api !!!
// use the disk storage to configure the filename and extension.
