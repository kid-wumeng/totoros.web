<template lang="jade">
  .left
    h1 {{ id ? '修改帖子' : '发布新帖子' }}
    c-input(v-model="title", placeholder="标题")
    input-content(v-model="content")
    .row.-right
      c-button(@click="submit") 确认发布
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':       require('components/@/input')
      'c-button':      require('components/@/button')
      'input-content': require('components/@/input-content')

    data: ->
      forum: @state['post-modal'].forum
      post:  @state['post-modal'].post
      id:    @state['post-modal'].post?.id ? 0
      title: @state['post-modal'].post?.title ? ''

    computed:
      content:  -> @state['input-content'].content
      pictures: -> @state['input-content'].pictures

    methods:
      submit: ->
        try
          @check()

          data =
            title:    @title
            content:  @content
            pictures: @pictures.map (pic) -> {
              id:    pic.id
              hash:  pic.hash
              image: pic.image
            }

          if @id
            api.call('post.update', @id, data).done(@updateDone)
          else
            api.call('post.create', @forum, data).done(@createDone)
        catch error
          @notify('fail', error)

      check: ->
        @model.post.checkTitle(@title)
        @model.post.checkContent(@content)

      createDone: (post) ->
        @notify('done', '发布成功')
        @commit('CREATE_POST', post)
        @commit('post-modal/HIDE')

      updateDone: (post) ->
        @notify('done', '修改成功')
        @commit('UPDATE_POST', post)
        @commit('post-modal/HIDE')
</script>


<style lang="less" scoped>
  .left{
    width: 600px;
    >*{
      margin-bottom: 16px;
    }
    >h1{
      font-size: 20px;
    }
  }
</style>