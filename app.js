// Load the HTTP module
const http = require("http");

// Define the server
const server = http.createServer((req, res) => {
  // Set the response header
  res.writeHead(200, { "Content-Type": "text/plain" });

  // Send the response body
  res.end("Hello, World!\n");
});

// Start the server on port 4000
const PORT = 4000;
server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
});
