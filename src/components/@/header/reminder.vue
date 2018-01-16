<template lang="jade">
  .reminder(@click="$router.push('/notices')")
    .icon.fa-bell-o(v-if="checkined && login")
    .count.-noSmoothing(v-if="count", :class="countClass") {{ countLabel }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    computed:
      count: -> @state['reminder'].count

      bit: ->
        if @count <= 9
          return 1
        else if @count <= 99
          return 2
        else
          return 3

      countLabel: ->
        if @count <= 99
          return "#{@count}"
        else
          return "99+"

      countClass: ->
        '-bit1': @bit is 1
        '-bit2': @bit is 2
        '-bit3': @bit is 3

    created: ->
      @init()

    watch:
      '$route': (route) ->
        if(route.path isnt '/notices')
          @init()

    methods:
      init: ->
        @dispatch('reminder/check')
</script>


<style lang="less" scoped>
  .reminder{
    margin-right: 28px;
    cursor: pointer;
    position: relative;
    .icon{
      font-size: 18px;
    }
    .count{
      position: absolute;
      left: 6px;
      top: -8px;
      height: 18px;
      text-align: center;
      font-size: 12px;
      color: #FFF;
      background-color: #F1565C;
      transform: scale3d(0.7, 0.7, 1);
      display: flex;
      justify-content: center;
      align-items: center;
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
