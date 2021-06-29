import { Response } from "express";
import Post from "../../models/post";

module.exports = {
  getPosts: async (req: Request, res: Response) => {
    try {
      const posts = await Post.find();
      res.json(posts);
    } catch (error) {
      console.log(error);
    }
  },
};
