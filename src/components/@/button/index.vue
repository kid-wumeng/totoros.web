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
    height: 32px;
    line-height: 32px;
    padding: 0 12px;
    font-weight: 600;
    font-size: 13px;
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
  .button.-gray{
    line-height: 31px;
    color: #707C88;
    background-image: none;
    border: 1px solid #F2F2F2;
  }
  .button.-disabled{
    padding: 0 11px;
    line-height: 31px;
    color: #DDD;
    background-image: none;
    border: 1px dashed #E2E2E2;
    cursor: default;
  }
</style>
