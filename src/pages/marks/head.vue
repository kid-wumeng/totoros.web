<template lang="jade">
  .head
    .wrap
      desc-card(:name="name", :desc="desc")
        cdn-image(slot="face", path="assets/marks-desc-card-face?2018-01-15" square)
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
      'desc-card': require('components.h5/desc-card')

    data: ->
      name: 'MARKS'
      desc: '看看大家都标记了什么作品？'
</script>


<style lang="less" scoped>
  .head{
    background-color: #FFF;
    .wrap{
      margin: 0 auto;
      box-sizing: border-box;
      width: 800px;
      padding: 30px 0;
      .cdn-image{
        width: 64px;
        border-radius: 3px;
      }
    }
  }
</style>