<template lang="jade">
  .base
    desc-card(:name="name", :desc="desc")
      cdn-image(slot="face", path="assets/marks-desc-card-face?2018-01-15" square)
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
      'desc-card': require('components.h5/desc-card')

    data: ->
      name: '标记'
      desc: '收藏、评价、分享你喜欢的ACG作品\n这里展示了T友们的标记'
</script>


<style lang="less" scoped>
  .base{
    padding: 20px;
    background-color: #FFF;
    .cdn-image{
      width: 64px;
      border-radius: 3px;
    }
  }
</style>