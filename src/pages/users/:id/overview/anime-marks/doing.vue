<template lang="jade">
  .doing
    .label 在看
    gallery(:cols="10", :padding="5")
      photo-frame(v-for="mark in marks", :key="mark.id")
        subject-face(:subject="mark.subject" fixed-height)
</template>


<script lang="coffee">
  module.exports =
    components:
      'gallery':      require('components/@/gallery')
      'photo-frame':  require('components/wiki/photo-frame')
      'subject-face': require('components/image/subject-face')

    props:
      'user':
        type: Object
        required: true

    computed:
      marks: ->
        return @user.marks.filter (mark) =>
          mark.status is 'doing' and @model.subject.isType(mark.subject.type, 'anime')
</script>


<style lang="less" scoped>
  .doing{
    display: flex;
    align-items: center;
    .label{
      margin-right: 20px;
      font-weight: 600;
      font-size: 13px;
      color: #A2AEBA;
    }
    .gallery{
      flex: auto;
    }
  }
</style>