<template lang="jade">
  .record.row.-top.-left
    .left
      .edit-date {{ model.date.display(record.editDate) }}
    .right
      .desc.row.-left
        user-name(:user="record.user")
        .verb {{ verb }}
      del.cast(v-if="showOldCast") {{ displayOldCast }}
      div.cast(v-if="showNewCast") {{ displayNewCast }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')

    props:
      'record':
        type: Object
        required: true

    computed:
      type:    -> @record.type
      oldCast: -> @record.oldCast
      newCast: -> @record.newCast

      verb: ->
        switch @type
          when 'create' then '+ 添加'
          when 'update' then '更新'
          when 'delete' then '- 删除'

      showOldCast: -> ['update', 'delete'].includes(@type)
      showNewCast: -> ['create', 'update'].includes(@type)

      displayOldCast: -> @displayCast(@oldCast)
      displayNewCast: -> @displayCast(@newCast)

    methods:
      displayCast: (cast) ->
        importance = cast.importance
        importance = model.assets.displayCastImportance(importance)
        role = cast.role
        role = "##{role.id} #{role.name}"
        role = "[#{role}]"
        persons = cast.persons ? []
        persons = persons.map (person) -> "##{person.id} #{person.name}"
        persons = persons.map (person) -> "[#{person}]"
        persons = persons.join(', ')
        persons = "声优：#{persons}" if(persons)
        return "#{importance}　#{role}　#{persons}"
</script>


<style lang="less" scoped>
  .record{
    margin-bottom: 12px;
    .left{
      width: 80px;
      text-align: right;
      .edit-date{
        font-size: 13px;
      }
    }
    .right{
      flex: auto;
      margin-left: 12px;
      padding-bottom: 12px;
      border-bottom: 1px solid #F2F2F2;
      .desc{
        .user-name{
          font-size: 13px;
        }
        .verb{
          margin-left: 6px;
          font-size: 13px;
          color: #707C88;
        }
      }
      .cast{
        flex: auto;
        width: 380px;
        word-wrap: break-word;
        box-sizing: border-box;
        display: block;
        margin-top: 5px;
        font-weight: 600;
        font-size: 13px;
      }
      del.cast{
        color: #CCC;
        font-weight: 400;
      }
    }
  }
</style>
