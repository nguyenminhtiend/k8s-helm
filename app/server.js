const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');

const PORT = 3000;

const app = express();

app.use(bodyParser.json());
app.use(morgan('[App Server] :method :url :status :response-time ms'));

app.get('/ping', (req, res) => {
  return res.json({
    message: 'Pong! 🏓'
  });
});

app.get('/', (req, res) => {
  return res.send('This page is rendered from the App');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
