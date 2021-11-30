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
        members: [...body.members.map((member) => member.id), connectedUser],
      };

      const newGroup = await Group.create(group);
      res.json(newGroup).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  getGroups: async ({ params: { connectedUser } }: Request, res: Response) => {
    const groups = await Group.find({ members: connectedUser });
    res.json(groups);
  },

  getGroupById: async (
    { params: { groupId } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const group = await Group.findById(groupId)
        .populate({
          path: "members",
          select: {
            name: 1,
            avatar: 1,
          },
        })
        .populate({
          path: "challenges",
          match: {
            isActive: false,
          },
          populate: {
            path: "posts.author",
            model: "user",
            select: {
              name: 1,
              avatar: 1,
            },
          },
        });
      res.json(group).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
