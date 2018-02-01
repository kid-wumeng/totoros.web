<template lang="jade">
  .head
    row.wrap.-between.-center
      desc-card(:name="name", :desc="desc")
        cdn-image(slot="face", path="assets/marks-desc-card-face?2018-01-15" square)
      .top-area
        row.tops
          .top 动画 Top100
          .top 漫画 Top100
          .top 游戏 Top100
        .hint 标记数还太少，榜单暂时不开放
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
      'desc-card': require('components/@/desc-card')

    data: ->
      name: '标记'
      desc: '收藏、评价、分享你喜欢的ACG作品\n这里展示了T友们的标记'
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
        width: 72px;
        border-radius: 3px;
      }
      .top-area{
        .tops{
          .top{
            padding: 4px 12px;
            font-size: 12px;
            font-weight: 500;
            color: #DDD;
            border: 1px solid #E4E4E4;
            border-radius: 2px;
            margin-right: 5px;
            &:last-child{
              margin-right: 0;
            }
          }
        }
        .hint{
          margin-top: 6px;
          text-align: center;
          font-size: 12px;
          font-weight: 500;
          color: #DDD;
        }
      }
    }
  }
</style>