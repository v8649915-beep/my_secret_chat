const fetch = require('node-fetch');
const express = require('express');
const app = express();
app.use(express.json());
app.post('/translate', async (req, res) => {
  try {
    const { text, target } = req.body;
    const resp = await fetch('https://libretranslate.de/translate', {
      method: 'POST',
      headers: { 'Content-Type':'application/json' },
      body: JSON.stringify({ q: text, source: 'auto', target, format: 'text' })
    });
    const j = await resp.json();
    res.json(j);
  } catch(e) {
    res.status(500).json({ error: e.toString() });
  }
});
module.exports = app;
