"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.postSchema = void 0;
const mongoose_1 = require("mongoose");
const mongodb_1 = require("mongodb");
exports.postSchema = new mongoose_1.Schema({
    authorId: { type: mongodb_1.ObjectId, required: true },
    belongsToChallenge: { type: Boolean, default: false },
    images: { type: [String], required: true },
    note: { type: Number, default: null },
    description: { type: String, required: true },
    comments: { type: [mongoose_1.Schema.Types.ObjectId], default: [] },
});
const postModel = (0, mongoose_1.model)("post", exports.postSchema);
exports.default = postModel;
