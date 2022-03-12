import { parseSentences } from "mw-simple-nlp";
import Fastify from "fastify";

const fastify = Fastify({
  logger: true,
});

fastify.get("/", (request, reply) => {
  reply.send({ hello: "world" });
});

fastify.post("/", (request, reply) => {
  console.log(request.body);
  let content: any = request.body;
  let text: string = content.content;

  reply.send({ lines: parseSentences(text) });
});

// Run the server!
fastify.listen(3000, "0.0.0.0", (err, address) => {
  if (err) throw err;
  // Server is now listening on ${address}
});
