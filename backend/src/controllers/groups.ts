import { NextFunction, Request, Response } from "express";

module.exports = {
  createGroup: async (
    { body: { title }, file, params: { id } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      console.log(id);
      console.log(title);
      console.log(file);
      res.end();
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
