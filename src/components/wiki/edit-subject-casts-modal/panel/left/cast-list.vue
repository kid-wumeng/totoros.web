<template lang="jade">
  .cast-list
    .cast.row(v-for="(cast, index) in casts", :key="index")
      .row.-left
        role-face(:role="cast.role" square)
        .importance {{ model.assets.displayCastImportance(cast.importance) }}
        .role {{ displayRole(cast.role) }}
      .row.-right
        .hint(v-if="cast.persons && cast.persons.length") 声优：
        .person(v-for="(person, index) in cast.persons", :key="index") {{ displayPerson(person) }}
        c-button.del.-gray(@click="del(cast)") 删除
        c-button.edit(@click="$emit('edit', cast)") 编辑
</template>


<script lang="coffee">
  module.exports =
    components:
      'role-face':   require('components/image/role-face')
      'person-face': require('components/image/person-face')
      'c-button':    require('components/@/button')

    props:
      'subject':
        type: Object
        required: true
      'casts':
        type: Array
        default: -> []

    methods:
      displayRole: (role) ->
        id   = role?.id
        name = role?.name
        return "##{id} #{name}"

      displayPerson: (person) ->
        id   = person?.id
        name = person?.name
        return "##{id} #{name}"

      del: (cast) ->
        result = await @api.call('subject.deleteCast', @subject.id, cast.role.id)
        @notify('done', '删除成功')
        @commit('UPDATE_SUBJECT', result.subject)
        @commit('edit-subject-casts-modal/ADD_RECORD', result.record)
</script>


<style lang="less" scoped>
  .cast-list{
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    .role-face{
      width: 32px;
    }
    .importance{
      margin-left: 10px;
      font-size: 13px;
    }
    .role{
      margin-left: 10px;
      font-weight: 600;
      font-size: 13px;
    }
    .person{
      font-size: 13px;
      margin-right: 10px;
    }
    .button.del{
      margin-right: 10px;
    }
  }
</style>