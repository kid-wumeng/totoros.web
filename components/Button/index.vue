<template lang="jade">
   .Button(@click="click") {{ text }}
</template>



<script lang="coffee">
   module.exports =
      props:
         'text':
            type: String
            required: true

         'type':
            type: String
            default: 'solid'
            validator: (type) => ['solid', 'ghost'].includes(type)

      methods:
         click: ->
            @$emit('click')
</script>



<style lang="less">
   @media @small {
   }

   @media @large {
      .Button {
         height: 36px;
         line-height: 36px;
         padding: 0 20px;
         font-weight: 600;
         font-size: 14px;
         text-align: center;
         color: #FFF;
         border-radius: 3px;
         user-select: none;
         cursor: pointer;
         background-image: linear-gradient(-180deg, #53BD66 0%, #16a085 80%);
         box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
      }
      .Button:active{
         background-image: linear-gradient(-180deg, #1E8470 0%, #16a085 80%);
         box-shadow: none;
      }
   }

   @import '~assets/@';
</style>