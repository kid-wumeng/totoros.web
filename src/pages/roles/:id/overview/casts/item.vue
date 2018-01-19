<template lang="jade">
  row.item
    .left
      subject-face(:subject="subject" frame)
    .right
      row.-between.-center
        row.-center
          subject-name.-more(:subject="subject")
        sep-row
          row.-center(v-for="(person, index) in persons", :key="index")
            person-name(:person="person")
      .importance {{ importance }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'sep-row':      require('components/@/sep-row')
      'subject-face': require('components/image/subject-face')
      'subject-name': require('components/wiki/subject-name')
      'person-name':  require('components/wiki/person-name')

    props:
      'cast':
        type: Object
        required: true

    computed:
      subject:    -> @cast.subject
      persons:    -> @cast.persons ? []
      importance: -> model.cast.displayImportance(@cast.importance)
</script>


<style lang="less" scoped>
  .item{
    padding: 12px;
    &:nth-child(even){
      background-color: rgb(250, 250, 250);
    }
    >.right{
      flex: auto;
      margin-left: 10px;
    }
    .subject-face{
      width: 40px;
    }
    .subject-name{
      font-size: 13px;
    }
    .importance{
      font-size: 12px;
      color: #A2AEBA;
    }
    .person-name{
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>