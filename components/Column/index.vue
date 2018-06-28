<template lang="jade">
   .Column(:class="columnClass")
      slot
</template>



<script lang="coffee">
   module.exports =
      props:
         'x':
            type: String
            default: 'fill'
            validator: (x) => ['left', 'center', 'right', 'fill'].includes(x)

         'y':
            type: String
            default: 'top'
            validator: (y) => ['top', 'center', 'bottom', 'between', 'around'].includes(y)

      computed:
         'columnClass': ->
            'x-left':    @x is 'left'
            'x-center':  @x is 'center'
            'x-right':   @x is 'right'
            'x-fill':    @x is 'fill'
            'y-top':     @y is 'top'
            'y-center':  @y is 'center'
            'y-bottom':  @y is 'bottom'
            'y-between': @y is 'between'
            'y-around':  @y is 'around'
</script>



<style lang="less">
   .Column {
      display: flex;
      flex-direction: column;

      &.x-left    { align-items: flex-start}
      &.x-center  { align-items: center }
      &.x-right   { align-items: flex-end }
      &.x-fill    { align-items: stretch }
      &.y-top     { justify-content: flex-start }
      &.y-center  { justify-content: center }
      &.y-bottom  { justify-content: flex-end }
      &.y-between { justify-content: space-between }
      &.y-around  { justify-content: space-around }
   }
</style>