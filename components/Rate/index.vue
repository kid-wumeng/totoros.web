<template lang="jade">
   .Rate(:size="size", :class="rateClass")
      .star(v-for="i in 7", :key="i", :class="getStarClass(i)" @click="click(i)")
</template>



<script lang="coffee">
   module.exports =


      model:
         prop:  'score'
         event: 'change'


      props:
         'score':
            type: Number
            default: 0
            validator: (score) => [0, 1, 2, 3, 4, 5, 6, 7].includes(score)

         'size':
            type: String
            default: 'small'
            validator: (size) => ['small', 'large'].includes(size)

         'changeable':
            type: Boolean
            default: false


      computed:
         'rateClass': ->
            '-changeable': @changeable


      methods:
         getStarClass: (i) ->
            if i <= @score
               return {'-active': true}
            else
               return {}


         click: (i) ->
            if @changeable
               if i is @score
                  @$emit('change', 0)
               else
                  @$emit('change', i)
</script>



<style lang="less">
   .Rate {
      overflow: hidden;

      .star {
         float: left;
         background-image: url('~/assets/images/star.png');
         background-repeat: no-repeat;
         background-position: center;
         background-size: contain;
         opacity: 0.6;
      }

      .star.-active {
         background-image: url('~/assets/images/star-active.png');
         opacity: 1;
      }
   }

   .Rate[size="small"] {
      .star {
         width: 14px;
         height: 14px;
      }
   }

   .Rate[size="large"] {
      .star {
         width: 36px;
         height: 36px;
      }
      .star:not(:first-child) {
         margin-left: 1px;
      }
   }

   .Rate.-changeable {
      .star {
         cursor: pointer;
      }
   }
</style>