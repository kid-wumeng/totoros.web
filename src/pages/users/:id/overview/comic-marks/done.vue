<template lang="jade">
  .done
    .label 看过
    gallery(:cols="10", :padding="5")
      subject-face(v-for="mark in marks", :key="mark.id", :subject="mark.subject" frame fixed-height)
</template>


<script lang="coffee">
  module.exports =
    components:
      'gallery':      require('components/@/gallery')
      'subject-face': require('components/image/subject-face')

    props:
      'user':
        type: Object
        required: true

    computed:
      marks: ->
        return @user.marks.filter (mark) =>
          mark.status is 'done' and @model.subject.isType(mark.subject.type, 'comic')
</script>


<style lang="less" scoped>
  .done{
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