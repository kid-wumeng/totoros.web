<template lang="jade">
   canvas.Radar
</template>



<script lang="coffee">


   ch = require('convex-hull')


   module.exports =

      props:
         'items':
            type: Array
            default: -> []
            validator: (items) => items.every (item) => item?.data?


      data: ->
         canvas: null
         ctx:    null
         size:   0


      computed:
         count: ->
            return @items.length


         radius: ->
            return @size / 2


         origin: ->
            x: @size / 2
            y: @size / 2


         vertexs: ->
            @getVertexs(0.7)


         textVertexs: ->
            @getVertexs(0.85)


         dataPoints: ->
            return @vertexs.map (vertex, i) =>
               @getDataPoint(vertex, @items[i].data)


      mounted: ->
         @update()


      updated: ->
         @update()


      methods:

         update: ->
            @canvas = @$el
            @ctx    = @canvas.getContext('2d')
            @size   = @canvas.offsetWidth

            @initCanvas()
            @drawVertexFrame()
            @drawDataFrame()
            @drawText()



         getVertexs: ( ratio = 1 ) ->

            vertexs    = []
            start      = -90
            deltaAngle = 360 / @count

            for i in [0...@count]
               angle  = start + i * deltaAngle
               vertex = @getVertex(angle, ratio)
               vertexs.push(vertex)

            return vertexs



         getVertex: ( angle, ratio ) ->

            x = @origin.x + (@radius * ratio) * Math.cos(angle * Math.PI / 180)
            y = @origin.y + (@radius * ratio) * Math.sin(angle * Math.PI / 180)

            x = Math.round(x)
            y = Math.round(y)

            return { x, y }



         getDataPoint: ( vertex, data ) ->

            distance = @getDistance(@origin, vertex)
            ratio    = @getRatio(data)

            dataDistance = distance * ratio

            x = (dataDistance * (vertex.x - @origin.x) ) / distance + @origin.x
            y = (dataDistance * (vertex.y - @origin.y) ) / distance + @origin.y

            x = Math.round(x)
            y = Math.round(y)

            return { x, y }



         getDistance: ( p1, p2 ) ->

            dx = p1.x - p2.x
            dy = p1.y - p2.y

            dx2 = Math.pow(dx, 2)
            dy2 = Math.pow(dy, 2)

            return Math.sqrt(dx2 + dy2)



         getRatio: ( data ) ->
            switch
               when data < 0   then 0
               when data > 100 then 1
               else data / 100



         getAngle: ( o, p ) ->

            dx = p.x - o.x
            dy = p.y - o.y

            angle = Math.atan2(dy, dx) * 180 / Math.PI

            return Math.round(angle)



         isSamePoint: ( p1, p2 ) ->
            return p1.x is p2.x and p1.y is p2.y



         findConvexPoints: ->

            points = [ @dataPoints..., @origin ]

            tuples = points.map ( point ) => [ point.x, point.y ]

            indexs = ch( tuples )

            convex = indexs.map ( index ) => points[index[0]]

            return convex



         initCanvas: ->

            dpr = io.dpr()

            @canvas.style.width  = @size + 'px'
            @canvas.style.height = @size + 'px'
            @canvas.width        = @size * dpr
            @canvas.height       = @size * dpr

            @ctx.scale(dpr, dpr)



         drawVertexFrame: ->

            @ctx.beginPath()

            for vertex, i in @vertexs
               if i is 0
                  @ctx.moveTo( vertex.x, vertex.y )
               else
                  @ctx.lineTo( vertex.x, vertex.y )

            @ctx.closePath()

            @ctx.strokeStyle = '#EAEAEA'
            @ctx.stroke()



         drawDataFrame: ->

            @ctx.beginPath()

            for point, i in @findConvexPoints()
               if i is 0
                  @ctx.moveTo( point.x, point.y )
               else
                  @ctx.lineTo( point.x, point.y )

            @ctx.closePath()

            grd = @ctx.createLinearGradient(0, 0, @size, @size)
            grd.addColorStop(0.0, 'rgba(22, 160, 133, 0.8)')
            grd.addColorStop(1.0, 'rgba(83, 189, 102, 0.8)')

            @ctx.fillStyle = grd
            @ctx.fill()

            @ctx.lineWidth   = 1
            @ctx.strokeStyle = 'rgba(22, 160, 133, 0.8)'
            @ctx.stroke()



         drawText: ->

            for item, i in @items

                vertex = @textVertexs[i]

                @ctx.font = '12px Ubuntu'
                @ctx.fillStyle = '#A2AEBA'
                @ctx.textAlign = 'center'
                @ctx.textBaseline = 'middle'

                @ctx.fillText(item.text, vertex.x, vertex.y)
</script>



<style lang="less">
   .Radar {
   }
</style>