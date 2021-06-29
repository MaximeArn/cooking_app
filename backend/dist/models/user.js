"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.userSchema = void 0;
const mongoose_1 = require("mongoose");
const post_1 = require("./post");
exports.userSchema = new mongoose_1.Schema({
    name: { type: String, required: true },
    email: { type: String, required: true },
    password: { type: String, required: true },
    avatar: { type: String, default: "" },
    posts: { type: [post_1.postSchema], default: [] },
});
exports.default = mongoose_1.model("user", exports.userSchema);
