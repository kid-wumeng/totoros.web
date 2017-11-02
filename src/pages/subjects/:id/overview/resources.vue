<template lang="jade">
  detail-area.resources(v-if="resources.length" title="资源Links")
    .col.-left
      a.link(v-for="(resource, index) in resources", :key="index", :href="resource.url" target="_blank") {{ host(resource) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components/wiki/detail-area')

    props:
      'subject':
        type: Object
        required: true

    computed:
      resources: -> @subject.resources ? []

    methods:
      host: (resource) ->
        dict = @model.assets.parseUrl(resource.url)
        return dict.host
</script>


<style lang="less" scoped>
  .resources{
    a{
      display: block;
      padding-bottom: 2px;
      &:last-child{
        padding-bottom: 0;
      }
    }
  }
</style>
