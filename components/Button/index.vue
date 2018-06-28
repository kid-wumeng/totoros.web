<template lang="jade">
   .Button(:type="type" @click="click") {{ text }}
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
            validator: (type) => ['solid', 'ghost', 'light', 'alert'].includes(type)

      methods:
         click: ->
            @$emit('click')
</script>



<style lang="less">

   @padding: 20px;

   .Button {
      height: 34px;
      font-family: "Ubuntu";
      font-weight: 600;
      font-size: 14px;
      border-radius: 2px;
      cursor: pointer;
      user-select: none;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
   }

   .Button[type="solid"] {
      padding: 0 @padding;
      color: white;
      background-image: linear-gradient(-180deg, #53BD66 0%, #16a085 80%);
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);

      &:active{
         background-image: linear-gradient(-180deg, #1E8470 0%, #16a085 80%);
         box-shadow: none;
      }
   }

   .Button[type="ghost"] {
      padding: 0 @padding - 1;
      color: #14BEB4;
      border: 1px solid #14BEB4;
   }

   .Button[type="light"] {
      padding: 0 @padding - 1;
      color: #A2AEBA;
      border: 1px solid lighten(#A2AEBA, 16%);
   }

   .Button[type="alert"] {
      padding: 0 @padding - 1;
      color: red;
      border: 1px solid lighten(red, 24%);
   }
</style>