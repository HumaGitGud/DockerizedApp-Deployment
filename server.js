import express from 'express';

const app = express();
const PORT = 8080;
const HOST = '0.0.0.0'; // for docker to listen on 0.0.0.0 and not PC localhost

app.get('/', (req, res) => {
  res.send('<html><body style="background-color: black; color: white;">Hello World!</body></html>');
});

app.listen(PORT, HOST, () => {
  console.log(`Server started on http://${HOST}:${PORT}`);
});