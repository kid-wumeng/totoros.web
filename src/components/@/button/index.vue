<template lang="jade">
  .button(@click="$emit('click')")
    slot
</template>


<script lang="coffee">
  module.exports =
    data: -> {}
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
    font-size: 14px;
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
    line-height: 30px;
    color: #5C5C8F;
    background-color: #EAEAEB;
    background-image: none;
    border: 1px solid #CDCECE;
  }
</style>
