import { NextFunction, Request, Response } from "express";
import Group from "../../models/group";

module.exports = {
  createGroup: async ({ body }: Request, res: Response, next: NextFunction) => {
    try {
      console.log(body);
      const newGroup = await Group.create(body);
      console.log(newGroup);
      res.json(newGroup).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
