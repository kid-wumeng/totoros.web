<template lang="jade">
   .Grid
      slot
</template>



<script lang="coffee">
   module.exports =

      props:
         'cols':
            type: Number
            default: 8


      data: ->
         width:   0
         padding: 20


      computed:
         childWidth: ->
            return (@width - (@cols - 1) * @padding) / @cols


      mounted: ->
         @update()
         @io.resize(@$el, @update)


      methods:
         update: ->
            @width = @$el.offsetWidth
            @setChildStyle()


         setChildStyle: ->
            children = @$slots.default ? []
            children = children.map ( vnode ) => vnode.elm

            for child, i in children
                child.style.width = @childWidth + 'px'

                if i % @cols isnt 0
                   child.style.marginLeft = @padding + 'px'

                if i >= @cols
                   child.style.marginTop = @padding + 'px'
</script>



<style lang="less">
   .Grid {
      width: 100%;
      display: flex;
      flex-wrap: wrap;
   }
</style>