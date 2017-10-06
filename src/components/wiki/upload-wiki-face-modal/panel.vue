<template lang="jade">
  .panel(v-if="model")
    h1 上传词条封面
    photo-frame
      img(v-if="dataUrl", :src="dataUrl")
      .face(v-else)
        subject-face(v-if="type === 'subject'", :subject="model")
    .row.-auto
      file-select(@select="select"): c-button 选择本地图片
      c-button(:disabled="!dataUrl" @click="upload") 上传
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select':  require('components/@/file-select')
      'c-button':     require('components/@/button')
      'photo-frame':  require('components/wiki/photo-frame')
      'subject-face': require('components/image/subject-face')

    data: ->
      file: null
      dataUrl: ''

    computed:
      type:  -> @state['upload-wiki-face-modal'].type
      id:    -> @state['upload-wiki-face-modal'].id
      model: ->
        switch @type
          when 'subject'      then @state['subject-list'].items[@id]
          when 'role'         then @state['role-list'].items[@id]
          when 'person'       then @state['person-list'].items[@id]
          when 'organization' then @state['organization-list'].items[@id]

    methods:
      select: (file) ->
        @file = file
        @readDataUrl file, (@dataUrl) =>

      upload: ->
        switch @type
          when 'subject'      then method = 'subject.uploadFace'
          when 'role'         then method = 'role.uploadFace'
          when 'person'       then method = 'person.uploadFace'
          when 'organization' then method = 'organization.uploadFace'
        @toast('图片上传中...', 0)
        api.call(method, @id, @file).done(@done).fail(@fail)

      done: (subject) ->
        @commit('HIDE_TOAST')
        @notify('done', '上传成功！')
        @commit('UPDATE_SUBJECT', subject)
        @commit('HIDE_UPLOAD_WIKI_FACE_MODAL')

      fail: (error) ->
        @commit('HIDE_TOAST')
        @notify('fail', error.message, 5000)
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -5%;
    box-sizing: border-box;
    width: 250px;
    >h1{
      text-align: center;
      font-size: 20px;
      margin-bottom: 12px;
    }
    >.photo-frame{
      width: 100%;
      >img{
        display: block;
        width: 100%;
      }
      >.face{
        >*{
          width: 100%;
          cursor: default;
        }
      }
    }
    >.row{
      margin-top: 20px;
      >.file-select{
        margin-right: 6px;
        .button{
          width: 100%;
        }
      }
    }
  }
</style>
