"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.commentSchema = void 0;
const mongoose_1 = require("mongoose");
exports.commentSchema = new mongoose_1.Schema({
    content: { type: String, required: true },
    author: { type: String, required: true },
});
exports.default = (0, mongoose_1.model)("comment", exports.commentSchema);
