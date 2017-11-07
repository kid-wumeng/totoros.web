<template lang="jade">
  .by5_9
    .item(v-for="picture in pictures.slice(0, 9)", :key="picture.id")
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
  .by5_9{
    display: flex;
    flex-wrap: wrap;
    .item{
      box-sizing: border-box;
      width: 33.33%;
      pPicture{
        width: 100%;
      }
    }
  }
</style>