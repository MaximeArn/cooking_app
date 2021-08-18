import { Response } from "express";

module.exports = {
  uploadAvatar: ({ file: { filename } }, res: Response) => {
    const path = `http://localhost:4545/assets/images/avatars/${filename}`;
    console.log(path);
    res.json(path).status(200);
  },
};

//not the same name beetween the uploaded file name and the url returned by the api !!!
// use the disk storage to configure the filename and extension.
