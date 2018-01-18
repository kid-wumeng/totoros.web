<template lang="jade">
  a.text-button(:href="'#'+page") {{ text }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'text':
        type: String
        required: true
      'page':
        type: Number
        required: true
</script>


<style lang="less" scoped>
  .text-button{
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    width: 64px;
    height: 32px;
    font-weight: 600;
    font-size: 13px;
    color: #FFF;
    background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
    border-radius: 3px;
    cursor: pointer;
    user-select: none;
    &:active{
      background-image: linear-gradient(-180deg, #1E8470 0%, #16a085 90%);
    }
  }
</style>