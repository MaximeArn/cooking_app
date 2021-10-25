import { NextFunction, Request, Response } from "express";
import Group from "../../models/group";

module.exports = {
  createGroup: async (
    { body, params: { connectedUser } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const group = {
        name: body.name,
        members: { ...body.members.map((member) => member.id), connectedUser },
      };

      const newGroup = await Group.create(group);
      res.json(newGroup).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
