<template lang="jade">
  .mark-gallery
    .label {{ label }}
    gallery(:cols="7", :padding="5")
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
      'label':
        type: String
        required: true
      'marks':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .mark-gallery{
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