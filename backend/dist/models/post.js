"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.postSchema = void 0;
const mongoose_1 = require("mongoose");
const comment_1 = require("./comment");
exports.postSchema = new mongoose_1.Schema({
    image: { type: String, required: true },
    note: { type: Number, default: null },
    comments: { type: [comment_1.commentSchema], default: [] },
});
exports.default = mongoose_1.model("post", exports.postSchema);
