<template lang="jade">
  .frame(v-if="subject")
    detail-frame
      .name(slot="name") {{ subject.name }}
      .desc(slot="desc") {{ desc }}
      detail-tab-bar(
        slot="tab-bar",
        :tabs="tabs",
        :active="$route.meta.path",
        @change="change"
      )
      router-view(slot="main", :subject="subject")
      side-bar(slot="side", :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    props:
      'subject':
        type: Object
        required: true

    computed:
      name:       -> @subject.name
      nameOrigin: -> @subject.nameOrigin
      type:       -> @model.subject.displayType(@subject.type)
      season:     -> @subject.season
      desc: ->
        desc = @type
        if(@season)
          desc += " / Season #{@season}"
        return desc

      tabs: -> [{
        label: if @nameOrigin then @nameOrigin else @name
        value: ''
        link:  @getSubjectPath(@subject)
      },{
        label: 'EPISODE'
        value: 'episodes'
        count: @subject.episodeCount
        link:  @getSubjectPath(@subject, 'episodes')
      },{
        label: 'CAST'
        value: 'casts'
        count: @subject.castCount
        link:  @getSubjectPath(@subject, 'casts')
      },{
        label: 'STAFF'
        value: 'staffs'
        count: @subject.staffCount
        link:  @getSubjectPath(@subject, 'staffs')
      },{
        label: '标记'
        value: 'marks'
        count: @model.subject.markStat(@subject)
        link:  @getSubjectPath(@subject, 'marks')
      }]

    methods:
      change: (tab) ->
        @replaceSubjectPage(@subject, tab.value)
</script>


<style lang="less" scoped>
  .frame{
    display: flex;
    background-color: #FFF;
  }
</style>
