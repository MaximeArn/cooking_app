import { NextFunction, Request, Response } from "express";
import post from "../../models/post";
import Post from "../../models/post";
import User from "../../models/user";

module.exports = {
  getPosts: async (req: Request, res: Response) => {
    try {
      const posts: any = await Post.find();
      posts.map(async (post) => {
        const author = await User.findById(post.authorId, {
          name: 1,
          avatar: 1,
        });
        post.author = author;
      });
      res.json(posts);
    } catch (error) {
      console.log(error);
    }
  },

  votePost: async (
    { params: { postId }, body: { newNote } }: Request,
    res: Response
  ) => {
    try {
      const updatedPost = await Post.findByIdAndUpdate(
        postId,
        { note: newNote },
        { useFindAndModify: false, new: true }
      );
      res.json(updatedPost);
    } catch (error) {
      console.log(error);
    }
  },

  addPost: async ({ body }: Request, res: Response, next: NextFunction) => {
    try {
      const newPost = await Post.create(body);
      res.json(newPost);
    } catch (error) {
      console.log(error);
    }
  },
};
