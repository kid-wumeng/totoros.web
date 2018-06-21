<template lang="jade">
   .ProgressBar
      .value(:style="valueStyle")
</template>



<script lang="coffee">
   module.exports =

      props:
         'value':
            type: Number
            default: 0
         'total':
            type: Number
            default: 100

      computed:
         percent: ->
            if @value <= 0
               return 0
            else if @value >= @total
               return 100
            else
               return parseInt(@value / @total * 100)

         valueStyle: ->
            'width': @percent + '%'
</script>



<style lang="less">
   .ProgressBar {
      height: 4px;
      background-color: #F4F4F4;
      border-radius: 50px;

      > .value {
         height: 100%;
         background-image: linear-gradient(90deg, #66C277 0%, #16a085 90%);
         border-radius: 50px;
         display: flex;
         justify-content: flex-end;
         align-items: center;
         transition: width 0.3s ease;

         &::after {
            content: "";
            display: block;
            border-radius: 100%;
            box-shadow: 0 0 50px 5px rgba(255, 255, 255, 0.6);
         }
      }
   }
</style>