<template lang="jade">
   Modal.Dialog(:open="open" @close="close")
      Area
         slot
         Row(x="right" y="center")
            slot(name="action")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Modal': require('~/components/Modal').default
         'Area':  require('~/components/Area').default
         'Row':   require('~/components/Row').default

      props:
         'open':
            type: Boolean
            default: false

      methods:
         close: ->
            @$emit('close')
</script>



<style lang="less">

   @padding-x: 27px;
   @padding-y: 18px;
   @action-bar-height: 36px;

   .Dialog {
      .Area {
         min-width:  360px;
         max-width:  640px;
         min-height: 160px;
         padding-left:   @padding-x;
         padding-right:  @padding-x;
         padding-top:    @padding-y;
         padding-bottom: @padding-y + @action-bar-height;
         position: relative;

         > * {
            margin-top: @padding-y;
         }

         > *:first-child {
            margin-top: 0;
         }

         > .Row {
            margin-top: 0;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: @action-bar-height;
            border-top: 1px solid #F2F2F2;

            > * {
               display: block;
               height: 100%;
               padding: 0 @padding-x;
               font-size: 13px;
               color: #939EA9;
               border-left: 1px solid #F2F2F2;
               outline: none;
               cursor: pointer;
               user-select: none;
               display: flex;
               justify-content: center;
               align-items: center;
               transition: color 0.2s ease;

               &:hover {
                  color: #273340;
               }
            }
         }
      }
   }
</style>