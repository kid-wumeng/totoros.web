module.exports = formatSubjectTypeOrWay = ( type, way ) ->

   if type is 'anime' and way
      return io.formatSubjectWay(way)
   else
      return io.formatSubjectType(type)