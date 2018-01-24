<template lang="jade">
  .action-sheets(v-if="admin")
    detail-box(title="操作")
      .wrap
        .action(v-if="admin", @click="top") ADMIN：{{ displayTop }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/bbs/detail-box')

    props:
      'post':
        type: Object
        required: true

    computed:
      displayTop: -> if @post.top then '取消置顶' else '置顶'

    methods:
      top: ->
        await @api.call('post.setTop', @post.id, !@post.top)
        @$set(@post, 'top', !@post.top)
        @notify('done', '操作成功')
</script>


<style lang="less" scoped>
  .action-sheets{
    .wrap{
      padding: 8px;
      .action{
        padding: 6px 8px;
        text-align: left;
        font-weight: 500;
        font-size: 13px;
        cursor: pointer;
        border-radius: 3px;
        &:hover{
          color: #FFF;
          background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
        }
      }
    }
  }
</style>