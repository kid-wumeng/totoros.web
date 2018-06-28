module.exports = isID = ( id ) ->


   if typeof(id) is 'number'
      id = id.toString()


   if typeof(id) is 'string'
      if /^[1-9]+$/.test(id)
         return true


   return false