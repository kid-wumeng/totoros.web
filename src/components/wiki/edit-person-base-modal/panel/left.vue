<template lang="jade">
  .left
    form-item(label="人物名" hint="优先使用中文")
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
        :value="birthDate",
        @change="changeBirthDate",
      )

    form-item(label="逝世日期")
      edit-input-date(
        :value="deathDate",
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
      person:      -> @state['edit-person-base-modal'].person
      name:        -> @person.name
      nameOrigin:  -> @person.nameOrigin
      nameAliases: -> @person.nameAliases
      intro:       -> @person.intro
      birthDate:   -> @person.birthDate
      deathDate:   -> @person.deathDate

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
        api.call('person.update', @person.id, data).done(@done)

      done: ({person, records}) ->
        @commit('UPDATE_PERSON', person)
        @commit('ADD_EDIT_PERSON_BASE_RECORDS', records)
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
