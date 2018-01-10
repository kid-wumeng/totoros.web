<template lang="jade">
  .relative-wiki-manager
    h1 关联词条
    .desc {{ desc }}
    .list
      c-button.-gray(@click="searchSubject") + 关联ACG作品
      .item(v-for="subject in relativeSubjects", :key="subject.id")
        span.link.del(@click="delSubject(subject)") (×)
        span.display {{ displaySubject(subject) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'desc':
        type: String
        default: ''
      'relativeSubjects':
        type: Array
        default: -> []

    methods:
      searchSubject: ->
        subject = await @dispatch('search-modal/show', {allowType: 'subject'})
        @$emit('add-subject', subject)

      delSubject: (subject) ->
        @$emit('del-subject', subject)

      displaySubject: (subject) ->
        id     = subject.id
        type   = @model.subject.displayTypes(subject.type)[0]
        name   = subject.name
        season = subject.season
        display = "##{id} #{type} #{name}"
        if(season)
          display += " Season #{season}"
        return display
</script>


<style lang="less" scoped>
  .relative-wiki-manager{
    width: 160px;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    >h1{
      font-size: 17px;
      margin-bottom: 3px;
    }
    .desc{
      font-size: 13px;
      color: #A2AEBA;
      margin-bottom: 32px;
    }
    .list{
      .button{
        margin-bottom: 8px;
      }
      .item{
        margin-top: 6px;
        font-size: 12px;
        .del{
          font-weight: 400;
          font-size: inherit;
          color: #ff4d4f;
        }
        .display{
          margin-left: 6px;
          font-weight: 600;
          font-size: inherit;
          color: #A2AEBA;
        }
      }
    }
  }
</style>
