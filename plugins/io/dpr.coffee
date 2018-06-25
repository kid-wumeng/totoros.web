module.exports = dpr = ->

   if window
      return window.devicePixelRatio ? 1
   else
      return 1