<template lang="jade">
  .left
    form-item(label="团体名" hint="优先使用中文")
      edit-input(
        :value="name",
        @change="changeName",
      )

    form-item(label="原名")
      edit-input(
        :value="nameOrigin",
        @change="changeNameOrigin",
      )

    form-item(label="别名")
      edit-input-tag(
        prompt-message="别名",
        :tags="nameAliases",
        @change="changeNameAliases",
      )

    form-item(label="简介")
      edit-input-area(
        :value="intro",
        @change="changeIntro",
      )

    form-item(label="成立日期")
      edit-input-date(
        :dateGroup="establishDate",
        @change="changeEstablishDate",
      )

    form-item(label="解散日期")
      edit-input-date(
        :dateGroup="disbandDate",
        @change="changeDisbandDate",
      )
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':        require('components/@/button')
      'form-item':       require('components/@/form-item')
      'edit-input':      require('components/wiki/edit-input')
      'edit-input-area': require('components/wiki/edit-input-area')
      'edit-input-tag':  require('components/wiki/edit-input-tag')
      'edit-input-date': require('components/wiki/edit-input-date')

    computed:
      organization:  -> @state['edit-organization-base-modal'].organization
      name:          -> @organization.name
      nameOrigin:    -> @organization.nameOrigin
      nameAliases:   -> @organization.nameAliases
      intro:         -> @organization.intro
      establishDate: -> @organization.establishDate
      disbandDate:   -> @organization.disbandDate

    methods:
      changeName: (name) ->
        @submit({name})

      changeNameOrigin: (nameOrigin) ->
        @submit({nameOrigin})

      changeNameAliases: (nameAliases) ->
        @submit({nameAliases})

      changeIntro: (intro) ->
        @submit({intro})

      changeEstablishDate: (establishDate) ->
        @submit({establishDate})

      changeDisbandDate: (disbandDate) ->
        @submit({disbandDate})

      submit: (data) ->
        result = await @api.call('organization.update', @organization.id, data)
        @commit('UPDATE_ORGANIZATION', result.organization)
        @commit('ADD_EDIT_ORGANIZATION_BASE_RECORDS', result.records)
        @notify('done', '修改成功 ~', 800)
</script>


<style lang="less" scoped>
  .left{
    box-sizing: border-box;
    width: 600px;
    height: 100%;
    padding: 0 80px 0 30px;
    overflow: scroll;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>
