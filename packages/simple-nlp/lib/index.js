"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.parseSentences = void 0;
const natural_1 = __importDefault(require("natural"));
function parseSentences(content) {
    var tokenizer = new natural_1.default.SentenceTokenizer();
    return tokenizer.tokenize(content);
}
exports.parseSentences = parseSentences;
