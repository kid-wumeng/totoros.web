<template lang="jade">
   .Tip(@mouseenter="mouseenter" @mouseleave="mouseleave")
      slot
      .text(ref="text", v-html="textBr", :class="textClass", :style="textStyle")
</template>



<script lang="coffee">
   module.exports =

      props:
         'text':
            type: String
            required: true
         'open':
            type: Boolean
            default: false
         'auto':
            type: Boolean
            default: false


      data: ->
         left: 0
         top:  0
         autoOpen: false


      computed:
         textBr: ->
            return @text.trim().replace(/\n/g, '<br/>')

         textOpen: ->
            return @open or (@auto and @autoOpen)

         textClass: ->
            '-open': @textOpen

         textStyle: ->
            'left': @left + 'px'
            'top':  @top  + 'px'


      watch:
         'open': (open) ->
            if open
               @updateTextPosition()


      mounted: ->
         @updateTextPosition()


      methods:
         mouseenter: ->
            if @auto
               @updateTextPosition()
               @autoOpen = true


         mouseleave: ->
            if @auto
               @autoOpen = false


         updateTextPosition: ->
            root  = @$el
            text  = @$refs.text

            root  = root.getBoundingClientRect()
            text  = text.getBoundingClientRect()

            @left = -(text.width - root.width) / 2 + root.left
            @top  = -text.height + root.top - 10
</script>



<style lang="less">

   @color: rgba(68, 86, 105, 0.8);
   @size:  6px;

   .Tip {
      .text {
         position: fixed;
         padding: 6px 12px;
         line-height: 1.6;
         text-align: justify;
         white-space: nowrap;
         font-weight: 500;
         font-size: 12px;
         color: #FFF;
         background-color: @color;
         border-radius: 4px;
         pointer-events: none;
         opacity: 0;
         transition: opacity 0.2s ease;

         &::after {
            content: "";
            position: absolute;
         	top: 100%;
         	left: 50%;
            margin-left: -@size;
         	width: 0;
            height: 0;
            border: @size solid transparent;
         	border-top-color: @color;
         }
      }

      .text.-open {
         opacity: 1;
      }
   }
</style>