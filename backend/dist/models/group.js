"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.groupSchema = void 0;
const mongoose_1 = require("mongoose");
const mongodb_1 = require("mongodb");
exports.groupSchema = new mongoose_1.Schema({
    title: { type: String, required: true },
    avatar: { type: String, default: "default_group.jpeg" },
    challenges: { type: [], default: [] },
    members: { type: [mongodb_1.ObjectId], ref: "user", default: [] },
});
const groupModel = (0, mongoose_1.model)("group", exports.groupSchema);
exports.default = groupModel;
