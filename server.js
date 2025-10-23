import express from 'express';

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('<html><body style="background-color: black; color: white;">Hello World!</body></html>');
});

app.listen(PORT, () => {
  console.log(`Server started on http://localhost:${PORT}`);
});