<template lang="jade">
   #examples_Row
      div x="left" y="top"
      Row(x="left" y="top")
         .box.a
         .box.b
         .box.c

      div x="left" y="center"
      Row(x="left" y="center")
         .box.a
         .box.b
         .box.c

      div x="left" y="bottom"
      Row(x="left" y="bottom")
         .box.a
         .box.b
         .box.c

      div x="left" y="fill"
      Row(x="left" y="fill")
         .box.a
         .box.b
         .box.c

      div x="center" y="top"
      Row(x="center" y="top")
         .box.a
         .box.b
         .box.c

      div x="center" y="center"
      Row(x="center" y="center")
         .box.a
         .box.b
         .box.c

      div x="center" y="bottom"
      Row(x="center" y="bottom")
         .box.a
         .box.b
         .box.c

      div x="center" y="fill"
      Row(x="center" y="fill")
         .box.a
         .box.b
         .box.c

      div x="right" y="top"
      Row(x="right" y="top")
         .box.a
         .box.b
         .box.c

      div x="right" y="center"
      Row(x="right" y="center")
         .box.a
         .box.b
         .box.c

      div x="right" y="bottom"
      Row(x="right" y="bottom")
         .box.a
         .box.b
         .box.c

      div x="right" y="fill"
      Row(x="right" y="fill")
         .box.a
         .box.b
         .box.c

      div x="between" y="top"
      Row(x="between" y="top")
         .box.a
         .box.b
         .box.c

      div x="between" y="center"
      Row(x="between" y="center")
         .box.a
         .box.b
         .box.c

      div x="between" y="bottom"
      Row(x="between" y="bottom")
         .box.a
         .box.b
         .box.c

      div x="between" y="fill"
      Row(x="between" y="fill")
         .box.a
         .box.b
         .box.c

      div x="around" y="top"
      Row(x="around" y="top")
         .box.a
         .box.b
         .box.c

      div x="around" y="center"
      Row(x="around" y="center")
         .box.a
         .box.b
         .box.c

      div x="around" y="bottom"
      Row(x="around" y="bottom")
         .box.a
         .box.b
         .box.c

      div x="around" y="fill"
      Row(x="around" y="fill")
         .box.a
         .box.b
         .box.c
</template>



<script lang="coffee">
   module.exports =
      components:
         'Row': require('~/components/Row').default
</script>



<style lang="less">
   #examples_Row {
      .Row {
         width: 100%;
         background-color: #F6F6F6;
      }

      .box {
         display: flex;
         justify-content: center;
         align-items: center;
         &::after{
            width: 100px;
            font-weight: 600;
            font-size: 20px;
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
            height: 100px;
         }
      }

      .box.b {
         background-color: green;
         &::after{
            content: "B";
            height: 200px;
         }
      }

      .box.c {
         background-color: blue;
         &::after{
            content: "C";
            height: 50px;
         }
      }
   }
</style>