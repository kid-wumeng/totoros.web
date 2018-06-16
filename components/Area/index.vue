<template lang="jade">
   .Area
      .name(v-if="name") {{ name }}
      slot
</template>



<script lang="coffee">
   module.exports =
      props:
         'name':
            type: String
            default: ''
</script>



<style lang="less">
   .Area {
      background-color: white;
      border-radius: 2px;
      box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);

      > .name {
         padding: 10px 20px;
         text-align: center;
         font-weight: 600;
         font-size: 14px;
         color: #AAA;
         border-bottom: 1px solid #F6F6F6;
      }
   }
</style>