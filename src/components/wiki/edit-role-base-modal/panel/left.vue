<template lang="jade">
  .left
    form-item(label="角色名" hint="优先使用中文")
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

    form-item(label="出生日期")
      edit-input-date(
        :dateGroup="birthDate",
        @change="changeBirthDate",
      )

    form-item(label="逝世日期")
      edit-input-date(
        :dateGroup="deathDate",
        @change="changeDeathDate",
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
      role:        -> @state['edit-role-base-modal'].role
      name:        -> @role.name
      nameOrigin:  -> @role.nameOrigin
      nameAliases: -> @role.nameAliases
      intro:       -> @role.intro
      birthDate:   -> @role.birthDate
      deathDate:   -> @role.deathDate

    methods:
      changeName: (name) ->
        @submit({name})

      changeNameOrigin: (nameOrigin) ->
        @submit({nameOrigin})

      changeNameAliases: (nameAliases) ->
        @submit({nameAliases})

      changeIntro: (intro) ->
        @submit({intro})

      changeBirthDate: (birthDate) ->
        @submit({birthDate})

      changeDeathDate: (deathDate) ->
        @submit({deathDate})

      submit: (data) ->
        result = await @api.call('role.update', @role.id, data)
        @commit('UPDATE_ROLE', result.role)
        @commit('edit-role-base-modal/ADD_RECORDS', result.records)
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
