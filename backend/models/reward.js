"use strict";
exports.__esModule = true;
exports.rewardSchema = void 0;
var mongoose_1 = require("mongoose");
exports.rewardSchema = new mongoose_1.Schema({
    image: { type: String, required: true },
    price: { type: Number, required: true },
    title: { type: String, required: true },
    description: { type: String, required: true }
});
exports["default"] = (0, mongoose_1.model)("reward", exports.rewardSchema);
