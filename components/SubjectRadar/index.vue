<template lang="jade">
   canvas.SubjectRadar
</template>



<script lang="coffee">
   module.exports =

      props:
         'subject':
            type: Object
            required: true



      mounted: ->
         @update()



      methods:
         update: ->

            items = @getItems()
            size  = @getSize()
            o     = @getOrigin(size)
            r     = @getRadius(size)
            vs    = @getVertexs(o, r, items)
            ss    = @getScorePoints(o, vs, items)

            canvas = @$el
            ctx    = canvas.getContext('2d')
            dpr    = io.dpr()

            @initCanvas(canvas, ctx, size)
            @drawVertexFrame(ctx, vs)
            @drawScoreFrame(ctx, ss, o)





         getItems: ->
            return [
               { label: 'world', score: 85 }
               { label: 'story', score: 0 }
               { label: 'chars', score: 0 }
               { label: 'paint', score: 0 }
               { label: 'music', score: 67 }
            ]



         getSize: ->
            return @$el.offsetWidth



         getOrigin: ( size ) ->
            return
               x: size / 2
               y: size / 2



         getRadius: ( size ) ->
            return size / 2



         getVertexs: ( o, r, items ) ->

            amount = items.length
            counts = [0...amount]
            angles = counts.map (count) => count * (360 / amount) - 90
            points = angles.map (angle) => @getVertex(o, r, angle)

            return points



         getVertex: ( o, r, angle ) ->

            x = o.x + r * Math.cos(angle * Math.PI / 180)
            y = o.y + r * Math.sin(angle * Math.PI / 180)

            x = Math.round(x)
            y = Math.round(y)

            return { x, y }



         getScorePoints: ( o, vs, items ) ->

            ss = vs.map (v, i) => @getScorePoint(o, v, items[i])
            ss = ss.filter (s) => s

            return ss



         getScorePoint: ( o, v, item ) ->

            if item.score > 0

               distance = @getDistance(o, v)

               score = item.score / 100 * distance

               x = (score * (v.x - o.x) ) / distance + o.x
               y = (score * (v.y - o.y) ) / distance + o.y

               x = Math.round(x)
               y = Math.round(y)

               return { x, y }

            else
               return null



         getDistance: ( p1, p2 ) ->

            dx = p1.x - p2.x
            dy = p1.y - p2.y

            dx2 = Math.pow(dx, 2)
            dy2 = Math.pow(dy, 2)

            return Math.sqrt(dx2 + dy2)



         initCanvas: ( canvas, ctx, size ) ->

            dpr = io.dpr()

            canvas.style.width  = size + 'px'
            canvas.style.height = size + 'px'
            canvas.width        = size * dpr
            canvas.height       = size * dpr

            ctx.scale(dpr, dpr)



         drawVertexFrame: ( ctx, vs ) ->

            ctx.beginPath()

            for v, i in vs
               if i is 0
                  ctx.moveTo(v.x, v.y)
               else
                  ctx.lineTo(v.x, v.y)

            ctx.closePath()

            ctx.strokeStyle = "#000000"
            ctx.stroke()



         drawScoreFrame: ( ctx, ss, o ) ->

            ctx.beginPath()

            ctx.moveTo(o.x, o.y)

            for s, i in ss
               if i is 0
                  ctx.lineTo(s.x, s.y)
               else
                  ctx.lineTo(s.x, s.y)

            ctx.closePath()

            ctx.strokeStyle = "red"
            ctx.stroke()
</script>



<style lang="less">
   .SubjectRadar {
   }
</style>