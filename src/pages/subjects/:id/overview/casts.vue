<template lang="jade">
  detail-area.casts(v-if="casts.length" title="CAST")
    grid
      .cast(v-for="cast in casts", :key="cast.id")
        role-face(:role="cast.role" circle)
        .importance {{ model.cast.displayImportance(cast.importance) }}
        role-name(:role="cast.role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components/wiki/detail-area')
      'grid':        require('components/@/grid')
      'role-face':   require('components/image/role-face')
      'role-name':   require('components/wiki/role-name')

    props:
      'subject':
        type: Object
        required: true

    computed:
      casts: -> @subject.casts ? []
</script>


<style lang="less" scoped>
  .casts{
    .cast{
      width: 20%;
      padding: 10px;
      text-align: center;
      .role-face{
      }
      .importance{
        margin-top: 5px;
        font-size: 12px;
        color: #A2AEBA;
      }
      .role-name{
        display: inline-block;
        margin-top: 2px;
        font-size: 13px;
      }
    }
  }
</style>
