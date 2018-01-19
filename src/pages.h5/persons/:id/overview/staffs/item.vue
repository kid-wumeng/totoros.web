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
    box-sizing: border-box;
    >.right{
      flex: auto;
      margin-left: 10px;
    }
    .subject-face{
      width: 56px;
    }
    .subject-name{
      font-size: 14px;
    }
    .job{
      margin-top: 2px;
      font-size: 13px;
      color: #A2AEBA;
    }
  }
</style>