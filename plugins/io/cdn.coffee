module.exports = ( path = '' ) ->

   if path and path[0] isnt '/'
      path = '/' + path

   if @dev()
      return 'http://p9rest0xh.bkt.clouddn.com' + path
   else
      return 'http://cdn.totoros.cc' + path