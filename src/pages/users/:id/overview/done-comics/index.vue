<template lang="jade">
  .done-comics
    detail-area(:title="title", :tabs="tabs")
      gallery(:cols="7", :padding="5")
        subject-face(v-for="mark in marks", :key="mark.id", :subject="mark.subject" fixed-height)
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/user/detail-area')
      'gallery':      require('components/@/gallery')
      'subject-face': require('components/image/subject-face')

    props:
      'user':
        type: Object
        required: true

    computed:
      title: -> "#{@user.name} 标记的漫画"

      tabs: ->
        tabs = @model.mark.STATUSES.map (status) =>
          displayStatus = @model.mark.displayStatus(status, 'comic')
          count  = @model.user.markStat(@user, status, 'comic')
          return{
            label: "#{displayStatus} #{count} 部"
            count: count
            click: => @toUserPage(@user, "comics?status=#{status}")
          }
        return tabs.filter (tab) -> tab.count

      marks: ->
        marks = @user.marks ? []
        marks = marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'comic')
        return marks
</script>


<style lang="less" scoped>
  .done-comics{
    .item{
    }
  }
</style>