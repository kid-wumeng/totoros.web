<template lang="jade">
   .Toast
      .text(v-html="textBr", :class="textClass")
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

      computed:
         textBr: ->
            return @text.trim().replace(/\n/g, '<br/>')

         textClass: ->
            '-open': @open
</script>



<style lang="less">
   .Toast {
      position: fixed;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      display: flex;
      justify-content: center;
      align-items: center;

      .text{
         padding: 6px 12px;
         line-height: 1.6;
         text-align: justify;
         white-space: nowrap;
         font-weight: 500;
         font-size: 12px;
         color: #FFF;
         background-color: rgba(39, 51, 64, 0.75);
         border-radius: 4px;
         opacity: 0;
         transition: opacity 0.2s ease;
      }

      .text.-open{
         opacity: 1;
      }
   }
</style>