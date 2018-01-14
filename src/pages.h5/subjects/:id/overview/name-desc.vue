<template lang="jade">
  .name-desc
    .name(slot="name") {{ subject.name }}
    .desc(slot="desc") {{ desc }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'subject':
        type: Object
        required: true

    computed:
      name:   -> @subject.name
      type:   -> @model.subject.displayType(@subject.type)
      season: -> @subject.season
      desc: ->
        desc = @type
        if(@season)
          desc += " / Season #{@season}"
        return desc
</script>


<style lang="less" scoped>
  .name-desc{
    margin-left: 16px;
    >.name{
      font-weight: 600;
      font-size: 18px;
    }
    >.desc{
      font-weight: 600;
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>