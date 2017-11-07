<template lang="jade">
  .by2_4
    .item(v-for="picture in pictures", :key="picture.id")
      c-picture(:picture="picture", square)
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-picture': require('components/image/picture')

    props:
      'pictures':
        type: Array
        required: true
</script>


<style lang="less" scoped>
  .by2_4{
    display: flex;
    flex-wrap: wrap;
    .item{
      box-sizing: border-box;
      width: 50%;
      .picture{
        width: 100%;
      }
    }
  }
</style>