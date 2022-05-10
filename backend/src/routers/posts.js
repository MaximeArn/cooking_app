"use strict";
exports.__esModule = true;
var express_1 = require("express");
var _a = require("../controllers/posts"), getPosts = _a.getPosts, votePost = _a.votePost, addPost = _a.addPost;
var postsRouter = (0, express_1.Router)();
postsRouter.get("/", getPosts);
postsRouter.patch("/:postId/note", votePost);
postsRouter.post("/", addPost);
exports["default"] = postsRouter;
