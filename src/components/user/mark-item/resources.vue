<template lang="jade">
  .resources(v-if="resources.length" title="资源Links")
    .resource.-more(v-for="(resource, index) in resources", :key="index")
      a.link.-line(:href="resource.url" target="_blank") {{ host(resource) }}
</template>


<script lang="coffee">
  module.exports =
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
    margin-top: 10px;
    width: 160px;
    text-align: right;
    .resource{
      a{
        display: inline-block;
        font-size: 13px;
      }
    }
  }
</style>
