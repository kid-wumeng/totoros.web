<template lang="jade">
  .comment-list(v-if="comments.length")
    .wrap
      comment-item(
        v-for="comment in comments",
        :key="comment.id",
        :comment="comment",
        :active="comment.id === cid",
        @reference="reference(comment)"
      )
    page-bar(:page="page", :size="size", :total="total" @change="changePage")
</template>


<script lang="coffee">
  module.exports =
    components:
      'comment-item': require('./comment-item')
      'page-bar':     require('components/@/page-bar')

    props:
      'comments':
        type: Array
        default: -> []
      'page':
        type: Number
        default: 1
      'size':
        type: Number
        default: 50
      'total':
        type: Number
        default: 0

    computed:
      cid: ->
        cid = @$route?.query?.cid
        if(cid)
          return parseInt(cid)
        else
          return 0

    mounted: ->
      setTimeout(@posToComment.bind(this), 300)

    activated: ->
      setTimeout(@posToComment.bind(this), 300)

    methods:
      changePage: (page) ->
        @$emit('change-page', page)

      reference: (comment) ->
        @$emit('reference', comment)

      posToComment: ->
        if(@cid)
          id = "comment-id-#{@cid}"
          el = document.querySelector("##{id}")
          if(el)
            top = el.getBoundingClientRect().top - 65
            window.scrollTo(0, top)
</script>


<style lang="less" scoped>
  .comment-list{
    .comment-item{
      border-bottom: 1px dashed #E4E8EB;
      &:last-child{
        border-bottom: none;
      }
    }
    .page-bar{
      border-top: 1px dashed #E4E8EB;
      padding: 30px;
    }
  }
</style>