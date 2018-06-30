<template lang="jade">
   .Remind
      Icon(name="bell")
      .count(v-show="count", :class="countClass") {{ countLabel }}
</template>



<script lang="coffee">
   module.exports =

      components:
         'Icon': require('~/components/Icon').default

      props:
         'count':
            type: Number
            required: true

      computed:
         bit: ->
            switch
               when @count <= 9  then 1
               when @count <= 99 then 2
               else                   3


         countClass: ->
            '-bit1': @bit is 1
            '-bit2': @bit is 2
            '-bit3': @bit is 3


         countLabel: ->
            if @count <= 99
               return "#{@count}"
            else
               return "99+"
</script>



<style lang="less">
   .Remind {
      user-select: none;
      position: relative;

      .Icon {
         font-weight: 600;
         font-size: 18px;
      }

      .count {
         position: absolute;
         left: 7px;
         top: -9px;
         height: 18px;
         line-height: 18px;
         text-align: center;
         font-family: "Ubuntu";
         font-weight: 600;
         font-size: 14px;
         color: #273340;
         background-color: white;
         transform: scale3d(0.75, 0.75, 1);

         &.-bit1{
            width: 18px;
            border-radius: 100%;
         }
         &.-bit2{
            width: 26px;
            border-radius: 50px;
         }
         &.-bit3{
            width: 34px;
            border-radius: 50px;
         }
      }
   }
</style>