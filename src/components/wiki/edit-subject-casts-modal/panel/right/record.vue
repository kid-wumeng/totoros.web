<template lang="jade">
  .record.row.-top.-left
    .left
      .date {{ model.date.display(record.editDate) }}
    .right
      user-name(:user="record.user")
      div.cast(v-if="showNewCast") {{ displayNewCast }}
      del.cast(v-if="showOldCast") {{ displayOldCast }}
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
    padding: 16px 20px;
    &:nth-child(odd){
      background-color: rgba(250, 250, 250, 1);
    }
    .left{
      width: 80px;
      text-align: right;
      .date{
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    .right{
      flex: auto;
      margin-left: 12px;
      .user-name{
        display: inline-block;
        font-size: 13px;
      }
      .cast{
        flex: auto;
        width: 380px;
        word-wrap: break-word;
        box-sizing: border-box;
        display: block;
        margin-top: 6px;
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
