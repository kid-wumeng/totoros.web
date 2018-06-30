<template lang="jade">
   #examples_SearchSide
      Row
         SearchSide(:query="query" @change="change")
         .query {{ query }}
</template>



<script lang="coffee">
   module.exports =
      components:
         'Row':        require('~/components/Row').default
         'SearchSide': require('~/components/SearchSide').default

      data: ->
         'query': {}

      methods:
         change: (@query) ->
</script>



<style lang="less">
   #examples_SearchSide {
      .SearchSide {
         flex: none;
         width: 380px;
      }
      .query {
         margin-left: 30px;
      }
   }
</style>