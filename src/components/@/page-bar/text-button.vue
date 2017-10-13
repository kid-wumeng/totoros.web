<template lang="jade">
  .text-button {{ text }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'text':
        type: String
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
    color: #707C88;
    background-color: rgba(250, 250, 250, 0.93);
    border: 1px solid #FFF;
    border-radius: 3px;
    box-shadow: 0 0 6px -3px #000;
    cursor: pointer;
  }
</style>