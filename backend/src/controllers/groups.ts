import { NextFunction, Request, Response } from "express";
import Group from "../../models/group";
import User from "../../models/user";

module.exports = {
  createGroup: async (
    { body: { title }, file, params: { id } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const newGroup = await Group.create({ title, members: [id] });
      console.log(newGroup._id);

      const updatedConnectedUser = await User.findByIdAndUpdate(
        id,
        {
          $push: { groups: newGroup._id },
        },
        { useFindAndModify: false, new: true }
      );

      res.json(updatedConnectedUser);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
