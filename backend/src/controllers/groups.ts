import { NextFunction, Request, Response } from "express";

module.exports = {
  createGroup: (req: Request, res: Response, next: NextFunction) => {
    try {
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
