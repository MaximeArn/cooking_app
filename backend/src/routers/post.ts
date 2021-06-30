import { Router } from "express";
const { getPosts, updatePost } = require("../controllers/post");

const postRouter = Router();

postRouter.get("/", getPosts);
postRouter.patch("/:postId", updatePost);

export default postRouter;
