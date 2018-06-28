ResizeObserver = require('resize-observer-polyfill').default



module.exports = resize = ( el, callback ) ->

   ro = new ResizeObserver(callback)
   ro.observe(el)