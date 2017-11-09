<template lang="jade">
  .input-content-picture-manager(v-if="pictures.length")
    h1 图片管理
    grid
      .item(v-for="picture in pictures", :key="picture.id", @click="dispatch('input-content/mountPicture', picture)")
        c-picture(:picture="picture", square, prevent)
        .id \#{{ picture.id }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'grid':      require('components/@/grid')
      'c-picture': require('components/image/picture')

    computed:
      pictures: -> @state['input-content'].pictures ? []
</script>


<style lang="less" scoped>
  .input-content-picture-manager{
    h1{
      font-size: 20px;
      margin-bottom: 16px;
    }
    .grid{
      @gap: 6px;
      width: 360px + 2 * @gap;
      .item{
        box-sizing: border-box;
        width: 120px;
        margin-top: @gap;
        margin-left: @gap;
        padding: 3px;
        background-color: rgba(252, 252, 252, 1);
        border: 1px solid rgb(240, 240, 240);
        box-shadow: 0 0 10px rgba(150, 150, 150, 0.1);
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
          margin-bottom: 2px;
          text-align: center;
          font-family: "Helvetica Neue";
          font-weight: 600;
          font-size: 13px;
          color: #707C88;
        }
      }
    }
  }
</style>
