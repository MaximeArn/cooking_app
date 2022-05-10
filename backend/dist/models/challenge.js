"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.challengeSchema = void 0;
const mongoose_1 = require("mongoose");
const post_1 = require("./post");
exports.challengeSchema = new mongoose_1.Schema({
    theme: { type: String, required: true },
    isActive: { type: Boolean, default: true },
    posts: { type: [post_1.postSchema], default: [] },
});
const challengeModel = (0, mongoose_1.model)("challenge", exports.challengeSchema);
exports.default = challengeModel;
