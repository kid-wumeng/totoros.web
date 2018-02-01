<template lang="jade">
  .admin-action-sheets
    detail-box(title="ADMIN")
      .wrap
        .action(@click="top") {{ displayTop }}

    move-post-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box':      require('components/bbs/detail-box')
      'move-post-modal': require('components/bbs/move-post-modal')

    props:
      'post':
        type: Object
        required: true

    computed:
      displayTop: -> if @post.top is 2 then '取消全局置顶' else '全局置顶'

    methods:
      top: ->
        if @post.top is 2
          await @api.call('post.setTop', @post.id, 0)
          @$set(@post, 'top', 0)
        else
          await @api.call('post.setTop', @post.id, 2)
          @$set(@post, 'top', 2)

        @notify('done', '操作成功')

      move: ->
        @dispatch('move-post-modal/show', @post)
</script>


<style lang="less" scoped>
  .admin-action-sheets{
    .wrap{
      padding: 8px;
      .action{
        padding: 7px 8px;
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