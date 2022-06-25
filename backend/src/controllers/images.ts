import { NextFunction, Response, Request } from "express";
import AWS, { AWSError } from "aws-sdk";

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

      //TODO: delete the previous avatar of the user
      // appeller la methode deleteImage et faire un res.end en fonction de si elle es utilisée dans un addImage ou non.
      //tester a la création de compte et lors de l'update de la photo de profil.
      // TODO : tester si l'ancien avatar et celui par default si ce n'est pas le cas on le suprime sinon on le garde.

      // imagesController.deleteImage(req, res, next);

      const s3Params = {
        Bucket: process.env.AWS_BUCKET_NAME,
        Key: file.originalname,
        Body: file.buffer,
        ACL: "public-read-write",
        ContentType: "image/jpeg",
      };

      s3.upload(s3Params, (err: AWSError, data) => {
        if (err) {
          throw new Error(err.message);
        } else {
          console.log(data.key);
          return res.json(data.key).status(200);
        }
      });
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  deleteImage: async (
    { body: { oldAvatar } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const s3params = {
        Bucket: process.env.AWS_BUCKET_NAME,
        Key: imagesController.getKeyFromPath(oldAvatar),
      };

      s3.deleteObject(s3params, (err) => {
        if (err) {
          throw new Error(err.message);
        } else {
          console.log(`${s3params.Key} image has been deleted `);
          return res.send().status(200);
        }
      });

      res.end();
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};

module.exports = imagesController;
