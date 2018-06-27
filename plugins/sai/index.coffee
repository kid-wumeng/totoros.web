Sai = require('sai.io/dist/index.web-lite')


if process.browser
   window.Sai = Sai
else
   global.Sai = Sai