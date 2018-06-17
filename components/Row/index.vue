<template lang="jade">
   .Row(:class="rowClass")
      slot
</template>



<script lang="coffee">
   module.exports =
      props:
         'x':
            type: String
            default: 'left'
            validator: (x) => ['left', 'center', 'right', 'between', 'around'].includes(x)

         'y':
            type: String
            default: 'top'
            validator: (y) => ['top', 'center', 'bottom', 'fill'].includes(y)

      computed:
         'rowClass': ->
            'x-left':    @x is 'left'
            'x-center':  @x is 'center'
            'x-right':   @x is 'right'
            'x-between': @x is 'between'
            'x-around':  @x is 'around'
            'y-top':     @y is 'top'
            'y-center':  @y is 'center'
            'y-bottom':  @y is 'bottom'
            'y-fill':    @y is 'fill'
</script>



<style lang="less">
   .Row {
      display: flex;

      &.x-left    { justify-content: flex-start }
      &.x-center  { justify-content: center }
      &.x-right   { justify-content: flex-end }
      &.x-between { justify-content: space-between }
      &.x-around  { justify-content: space-around }
      &.y-top     { align-items: flex-start }
      &.y-center  { align-items: center }
      &.y-bottom  { align-items: flex-end }
      &.y-fill    { align-items: stretch }
   }
</style>