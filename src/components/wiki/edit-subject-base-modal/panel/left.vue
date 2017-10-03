<template lang="jade">
  .left
    edit-item(label="类别")
      type-radio-bar(v-model="type" @change="changeType")

    edit-item(label="中文名")
      edit-input(:value="subject.name" @change="changeName")

    edit-item(label="原版名")
      edit-input(:value="subject.nameOrigin" @change="changeNameOrigin")

    edit-item(label="别名")
      edit-input-tag(:tags="subject.nameAliases" prompt-message="别名" @change="changeNameAliases")

    edit-item(label="简介")
      edit-input-area(:value="subject.intro" @change="changeIntro")

    edit-item(label="发行日期")
      edit-input-date(:dateGroup="subject.publishDate" @change="changePublishDate")

    edit-item(label="风格")
      radio-grid(v-model="styles", @change="changeStyles")
        radio(label="侦探", :value="1")
        radio(label="恋爱", :value="2")
        radio(label="科幻", :value="3")
        radio(label="科幻", :value="4")
        radio(label="科幻", :value="5")
        radio(label="科幻", :value="6")
        radio(label="科幻", :value="7")
        radio(label="科幻", :value="8")
        radio(label="科幻", :value="9")
        radio(label="科幻", :value="10")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':        require('components/@/button')
      'radio-grid':      require('components/@/radio-grid')
      'radio':           require('components/@/radio')
      'edit-item':       require('components/wiki/edit-item')
      'edit-input':      require('components/wiki/edit-input')
      'edit-input-area': require('components/wiki/edit-input-area')
      'edit-input-tag':  require('components/wiki/edit-input-tag')
      'edit-input-date': require('components/wiki/edit-input-date')
      'type-radio-bar':  require('components/wiki/type-radio-bar')

    props:
      'subject':
        type: Object
        required: true

    data: ->
      type: @subject.type
      styles: @subject.styles

    methods:
      changeType: (type) ->
        if type
          @submit({type})

      changeName: (name) ->
        @submit({name})

      changeNameOrigin: (nameOrigin) ->
        @submit({nameOrigin})

      changeNameAliases: (nameAliases) ->
        @submit({nameAliases})

      changeIntro: (intro) ->
        @submit({intro})

      changePublishDate: (publishDate) ->
        @submit({publishDate})

      changeStyles: (styles) ->
        @submit({styles})

      submit: (data) ->
        api.call('subject.update', @subject.id, data).done(@done)

      done: ->
        @notify('done', '修改成功 ~', 1200)
</script>


<style lang="less" scoped>
  .left{
    width: 480px;
    height: 100%;
    overflow: scroll;
    >*{
      margin-bottom: 16px;
    }
  }
</style>
