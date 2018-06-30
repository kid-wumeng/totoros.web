<template lang="jade">
   Row.Header(x="center")
      Row(x="between" y="center")
         Row(y="center")
            .logo 冰岛 · 硬核漫画
         Row(y="center")
            Remind(:count="remindCount")
            UserFace(:user="user")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':      require('~/components/Row').default
         'UserFace': require('~/components/UserFace').default
         'Remind':   require('./Remind').default

      props:
         'user':
            type: Object
            default: null
         'remindCount':
            type: Number
            default: 0
</script>



<style lang="less">
   .Header {
      width: 100%;
      font-family: "MF YueYuan (Noncommercial)";
      font-weight: 500;
      font-size: 18px;
      color: rgba(255, 255, 255, 0.85);
      background-color: rgba(255, 255, 255, 0.1);

      > .Row {
         width: 1000px;
         height: 56px;

         .Remind {
            margin-right: 36px;
         }

         .UserFace {
            width: 36px;
         }
      }
   }
</style>