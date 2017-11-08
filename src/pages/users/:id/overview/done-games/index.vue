<template lang="jade">
  .done-games
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
      title: -> "#{@user.name} 标记的游戏"

      tabs: ->
        tabs = @model.mark.STATUSES.map (status) =>
          displayStatus = @model.mark.displayStatus(status, 'game')
          count  = @model.user.markStat(@user, status, 'game')
          return{
            label: "#{displayStatus} #{count} 部"
            count: count
            click: => @toUserPage(@user, "games?status=#{status}")
          }
        return tabs.filter (tab) -> tab.count

      marks: ->
        marks = @user.marks ? []
        marks = marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'game')
        return marks
</script>


<style lang="less" scoped>
  .done-games{
    .item{
    }
  }
</style>