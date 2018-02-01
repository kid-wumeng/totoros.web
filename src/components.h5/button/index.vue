<template lang="jade">
  .button(:class="{'-disabled': disabled}" @click="click")
    slot
</template>


<script lang="coffee">
  module.exports =
    props:
      'disabled':
        type: Boolean
        default: false

    methods:
      click: ->
        if !@disabled then @$emit('click')
</script>


<style lang="less">
  .button{
    flex: none;
    box-sizing: border-box;
    display: inline-block;
    height: 36px;
    line-height: 36px;
    padding: 0 12px;
    font-weight: 600;
    font-size: 16px;
    text-align: center;
    color: #FFF;
    background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
    border-radius: 3px;
    user-select: none;
    cursor: pointer;
    &:active{
      background-image: linear-gradient(-180deg, #1E8470 0%, #16a085 90%);
    }
  }
</style>
