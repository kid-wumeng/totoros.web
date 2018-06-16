<template lang="jade">
   #examples_Column
      div    x="left" y="top"
      Column(x="left" y="top")
         .box.a
         .box.b
         .box.c

      div    x="left" y="center"
      Column(x="left" y="center")
         .box.a
         .box.b
         .box.c

      div    x="left" y="bottom"
      Column(x="left" y="bottom")
         .box.a
         .box.b
         .box.c

      div    x="left" y="between"
      Column(x="left" y="between")
         .box.a
         .box.b
         .box.c

      div    x="left" y="around"
      Column(x="left" y="around")
         .box.a
         .box.b
         .box.c

      div    x="center" y="top"
      Column(x="center" y="top")
         .box.a
         .box.b
         .box.c

      div    x="center" y="center"
      Column(x="center" y="center")
         .box.a
         .box.b
         .box.c

      div    x="center" y="bottom"
      Column(x="center" y="bottom")
         .box.a
         .box.b
         .box.c

      div    x="center" y="between"
      Column(x="center" y="between")
         .box.a
         .box.b
         .box.c

      div    x="center" y="around"
      Column(x="center" y="around")
         .box.a
         .box.b
         .box.c

      div    x="right" y="top"
      Column(x="right" y="top")
         .box.a
         .box.b
         .box.c

      div    x="right" y="center"
      Column(x="right" y="center")
         .box.a
         .box.b
         .box.c

      div    x="right" y="bottom"
      Column(x="right" y="bottom")
         .box.a
         .box.b
         .box.c

      div    x="right" y="between"
      Column(x="right" y="between")
         .box.a
         .box.b
         .box.c

      div    x="right" y="around"
      Column(x="right" y="around")
         .box.a
         .box.b
         .box.c

      div    x="fill" y="top"
      Column(x="fill" y="top")
         .box.a
         .box.b
         .box.c

      div    x="fill" y="center"
      Column(x="fill" y="center")
         .box.a
         .box.b
         .box.c

      div    x="fill" y="bottom"
      Column(x="fill" y="bottom")
         .box.a
         .box.b
         .box.c

      div    x="fill" y="between"
      Column(x="fill" y="between")
         .box.a
         .box.b
         .box.c

      div    x="fill" y="around"
      Column(x="fill" y="around")
         .box.a
         .box.b
         .box.c
</template>



<script lang="coffee">
   module.exports =
      components:
         'Column': require('~/components/Column').default
</script>



<style lang="less">
   #examples_Column {
      .Column {
         height: 180px;
         background-color: #F6F6F6;
      }

      .box {
         display: flex;
         justify-content: center;
         align-items: center;
         &::after{
            height: 30px;
            font-weight: 600;
            font-size: 16px;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
         }
      }

      .box.a {
         background-color: red;
         &::after{
            content: "A";
            width: 100px;
         }
      }

      .box.b {
         background-color: green;
         &::after{
            content: "B";
            width: 200px;
         }
      }

      .box.c {
         background-color: blue;
         &::after{
            content: "C";
            width: 50px;
         }
      }
   }
</style>