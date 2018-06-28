<template lang="jade">
   .Read(@click="click") Read PDF
</template>



<script lang="coffee">
   module.exports =
      props:
         'subject':
            type: Object
            required: true

      methods:
         click: ->
            window.open("/subjects/#{@subject.id}/vols")
</script>



<style lang="less">

   @color: #14BEB4;

   .Read {
      flex: none;
      padding: 0 9px;
      height: 26px;
      font-family: "Ubuntu";
      font-weight: 600;
      font-size: 13px;
      color: @color;
      border: 1px solid @color;
      border-radius: 2px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      user-select: none;

      &:hover {
         color: white;
         background-color: @color;
      }

      &:active {
         color: @color;
         background-color: transparent;
      }
   }
</style>