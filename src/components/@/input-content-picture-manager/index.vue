<template lang="jade">
  .input-content-picture-manager
    .row.-left.-wrap
      .picture(v-for="picture in pictures", :key="picture.id", @click="dispatch('input-content/mountPicture', picture)")
        c-picture(:picture="picture", square, prevent)
        .id {{ picture.id }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-picture': require('components/image/picture')

    computed:
      pictures: -> @state['input-content'].pictures
</script>


<style lang="less" scoped>
  .input-content-picture-manager{
    @gap: 6px;
    width: 360px + 2 * @gap;
    .picture{
      box-sizing: border-box;
      width: 120px;
      margin-top: @gap;
      margin-left: @gap;
      padding: @gap;
      background-color: #F6F6F6;
      cursor: pointer;
      transition: all 0.2s;
      &:nth-child(3n+1){
        margin-left: 0;
      }
      &:nth-child(1),
      &:nth-child(2),
      &:nth-child(3){
        margin-top: 0;
      }
      .id{
        margin-top: 5px;
        text-align: center;
        font-weight: 600;
        font-size: 16px;
        color: #707C88;
      }
    }
    .picture:hover{
      background-color: #EEE;
    }
  }
</style>
