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
    padding: 8px;
    &:nth-child(odd){
      background-color: rgba(250, 250, 250, 1);
    }
    >.right{
      flex: auto;
      margin-left: 8px;
    }
    .subject-face{
      width: 56px;
    }
    .subject-name{
      font-size: 13px;
    }
    .job{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>