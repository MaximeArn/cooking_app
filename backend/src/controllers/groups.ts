import { NextFunction, Request, Response } from "express";
import Group from "../../models/group";

module.exports = {
  createGroup: async ({ body }: Request, res: Response, next: NextFunction) => {
    try {
      console.log(body);
      const group = {
        name: body.name,
        members: body.members.map((member) => member.id),
      };
      console.log(group);

      const newGroup = await Group.create(group);
      console.log(newGroup);
      res.json(newGroup).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
