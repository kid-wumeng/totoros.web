<template lang="jade">
  .panel(v-if="model")
    h1 {{ title }}
    photo-frame
      img(v-if="dataUrl", :src="dataUrl")
      .face(v-else)
        subject-face(v-if="type === 'subject'", :subject="model")
        role-face(v-else-if="type === 'role'", :role="model")
        person-face(v-else-if="type === 'person'", :person="model")
        organization-face(v-else-if="type === 'organization'", :organization="model")
    .row.-auto
      file-select(@select="select"): c-button 选择本地图片
      c-button(:disabled="!dataUrl" @click="upload") 上传
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select':       require('components/@/file-select')
      'c-button':          require('components/@/button')
      'photo-frame':       require('components/wiki/photo-frame')
      'subject-face':      require('components/image/subject-face')
      'role-face':         require('components/image/role-face')
      'person-face':       require('components/image/person-face')
      'organization-face': require('components/image/organization-face')

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
      title: ->
        switch @type
          when 'subject'      then '上传作品封面'
          when 'role'         then '上传角色头像'
          when 'person'       then '上传人物头像'
          when 'organization' then '上传团体LOGO'

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
        try
          model = await @api.call(method, @id, @file)
          @done(model)
        catch error
          @fail(error)

      done: (model) ->
        @commit('HIDE_TOAST')
        @notify('done', '上传成功！')
        switch @type
          when 'subject'      then @commit('UPDATE_SUBJECT',      model)
          when 'role'         then @commit('UPDATE_ROLE',         model)
          when 'person'       then @commit('UPDATE_PERSON',       model)
          when 'organization' then @commit('UPDATE_ORGANIZATION', model)
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
