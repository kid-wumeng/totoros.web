<template lang="jade">
  row.item
    .left
      subject-face(:subject="subject" frame)
    .right
      subject-name.-more(:subject="subject")
      sep-row
        span.job(v-for="(job, index) in jobs", :key="index") {{ model.assets.displayStaffJob(job) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'sep-row':      require('components/@/sep-row')
      'subject-face': require('components/image/subject-face')
      'subject-name': require('components/wiki/subject-name')

    props:
      'staff':
        type: Object
        required: true

    computed:
      subject: -> @staff.subject
      jobs:    -> @staff.jobs
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
    .job{
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>