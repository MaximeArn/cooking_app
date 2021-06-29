import { Router } from "express";
const { getPosts } = require("../controllers/post");

const postRouter = Router();

postRouter.get("/", getPosts);

export default postRouter;
