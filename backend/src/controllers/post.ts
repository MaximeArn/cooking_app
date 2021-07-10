import { NextFunction, Request, Response } from "express";
import Post, { PostInterface } from "../../models/post";
import User from "../../models/user";

module.exports = {
  getPosts: async (_: Request, res: Response) => {
    try {
      const posts: PostInterface[] = await Post.find();

      const postsAndAuthors = posts.map(async (post) => {
        const author = await User.findById(post.authorId, {
          name: 1,
          avatar: 1,
        });
      });
      console.log(postsAndAuthors);
      res.json(postsAndAuthors);
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
