import { NextFunction, Response, Request } from "express";
import AWS, { AWSError } from "aws-sdk";
import fs from "fs";

const s3 = new AWS.S3();

const imagesController = {
  isDefaultAvatar: (path: string) => {
    return path.includes("default_avatar.jpg");
  },

  getKeyFromPath: (path: String) => {
    const partsOfPath = path.split("/");
    const fileName = partsOfPath[partsOfPath.length - 1];
    return fileName;
  },

  addImage: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const {
        file,
        body: { oldAvatar },
      } = req;

      console.log("NEW AVATAR : " + file);
      console.log("PREVIOUS AVATAR : " + oldAvatar);

      // //TODO: delete the previous avatar of the user
      // imagesController.deleteImage(req, res, next);

      const s3Params = {
        Bucket: process.env.AWS_BUCKET_NAME,
        Key: file.originalname,
        Body: file.buffer,
        ACL: "public-read-write",
        ContentType: "image/jpeg",
      };

      s3.upload(s3Params, (err: AWSError, { Location: path }) => {
        if (err) {
          throw new Error(err.message);
        } else {
          console.log(path);
          return res.json(path).status(200);
        }
      });
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  deleteImage: async (
    { body: { path } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const s3params = {
        Bucket: process.env.AWS_BUCKET_NAME,
        Key: imagesController.getKeyFromPath(path),
      };

      s3.deleteObject(s3params, (err, data) => {
        if (err) {
          throw new Error(err.message);
        } else {
          console.log(`${s3params.Key} image has been deleted `);
          return res.send().status(200);
        }
      });

      // res.end();
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  // uploadAvatar: async (
  //   { file: { filename, destination, path }, body: { oldAvatar } },
  //   res: Response,
  //   next: NextFunction
  // ) => {
  //   try {
  //     // remove previous avatar
  //     const previousAvatarPath = oldAvatar.replace(
  //       "http://localhost:4545/",
  //       ""
  //     );
  //     const absolutePreviousAvatarPath = Path.resolve(
  //       "public",
  //       previousAvatarPath
  //     );

  //     !imagesController.isDefaultAvatar(absolutePreviousAvatarPath) &&
  //       fs.unlinkSync("public" + absolutePreviousAvatarPath);

  //     // compress new avatar
  //     const compressedFilename = `${filename.substring(
  //       0,
  //       filename.length - 4
  //     )}-compressed.jpg`;
  //     const compressedAvatarPath = Path.resolve(
  //       destination,
  //       compressedFilename
  //     );
  //     await sharp(path).resize(180, 180).toFile(compressedAvatarPath);

  //     // remove full size avatar
  //     fs.unlinkSync(Path.resolve(path));

  //     const newPath = `/assets/images/avatars/${compressedFilename}`;
  //     res.json(newPath).status(200);
  //   } catch (error) {
  //     console.error(error);
  //     next(error);
  //   }
  // },
};

module.exports = imagesController;
