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
            @getVertexs(0.65)


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
            @drawVertexLines()
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



         isOrigin: ( p ) ->
            return p.x is @origin.x and p.y is @origin.y



         findConvexPoints: ->

            points = [ @dataPoints..., @origin ]

            tuples = points.map ( point ) => [ point.x, point.y ]

            indexs = ch( tuples )

            points = indexs.map ( index ) => points[index[0]]

            if points.length
               return points

            else
               # convex-hull 不会将 1 或 2 个点视为凸包，需要手动处理
               # 这种情况，雷达图上将呈现一条直线
               # 调用本方法的地方理应获知，以作相应处理，因此设置标志位 points.line = true

               points = @dataPoints.filter ( point ) => !@isOrigin( point )

               switch points.length
                  when 1 then points = points.concat([@origin])
                  when 2 then points = points
                  else        points = []

               points.line = true
               return points



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

            @ctx.strokeStyle = '#E2E2E2'
            @ctx.stroke()



         drawVertexLines: ->

            for vertex in @vertexs

               @ctx.beginPath()
               @ctx.moveTo( @origin.x, @origin.y )
               @ctx.lineTo( vertex.x, vertex.y )
               @ctx.closePath()

               @ctx.strokeStyle = '#E2E2E2'
               @ctx.stroke()



         drawDataFrame: ->

            points = @findConvexPoints()

            @ctx.beginPath()

            for point, i in points
               if i is 0
                  @ctx.moveTo( point.x, point.y )
               else
                  @ctx.lineTo( point.x, point.y )

            @ctx.closePath()

            gradient = @ctx.createLinearGradient(0, 0, @size, @size)
            gradient.addColorStop(0.0, 'rgba(22, 160, 133, 0.8)')
            gradient.addColorStop(1.0, 'rgba(83, 189, 102, 0.8)')

            @ctx.fillStyle = gradient
            @ctx.fill()

            @ctx.lineWidth = 3 if points.line

            @ctx.strokeStyle = 'rgba(22, 160, 133, 0.8)'
            @ctx.stroke()



         drawText: ->

            for item, i in @items

                vertex = @textVertexs[i]

                @ctx.font         = '12px Ubuntu'
                @ctx.fillStyle    = '#A2AEBA'
                @ctx.textAlign    = 'center'
                @ctx.textBaseline = 'middle'

                @ctx.fillText(item.text, vertex.x, vertex.y)
</script>



<style lang="less">
   .Radar {
      display: block;
   }
</style>