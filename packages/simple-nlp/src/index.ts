import natural from "natural";

// export function parseSentences(content: string) {
//   var tokenizer = new natural.SentenceTokenizer();
//   return tokenizer.tokenize(content);
// }

export const parseSentences = function (content: string) {
  const tokenizer = new natural.SentenceTokenizer();
  return tokenizer.tokenize(content);
};
