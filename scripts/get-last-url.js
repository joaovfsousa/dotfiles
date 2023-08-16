const stdin = process.openStdin();
let data = "";

const regexExpression =
  /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/gi;
const urlRegex = new RegExp(regexExpression);

stdin.on("data", function (chunk) {
  data += chunk;
});

stdin.on("end", function () {
  const lines = data.split("\n");
  for (let i = lines.length; i > 0; i--) {
    const line = lines[i];
    if (urlRegex.test(line)) {
      console.log(line.match(urlRegex)[0]);
      break;
    }
  }
});
