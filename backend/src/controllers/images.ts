import { Request, Response, NextFunction } from "express";
import multer from "multer";

module.exports = {
  uploadAvatar: (req: Request, res: Response, next: NextFunction) => {
    console.log("upload avatar !");
    const upload = multer({
      dest: "public/assets/images/avatars",
    });
  },
};
