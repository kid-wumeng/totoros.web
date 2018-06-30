<template lang="jade">
   Modal.SearchDialog(@close="close")
      Area
         SearchSide
         .main(v-if="mainOpen")
            SubjectList(v-show="view === 'list'", :subjects="subjects")
            SubjectGrid(v-show="view === 'grid'", :subjects="subjects")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Modal':       require('~/components/Modal').default
         'Area':        require('~/components/Area').default
         'SearchSide':  require('~/components/SearchSide').default
         'SubjectList': require('~/components/SubjectList').default
         'SubjectGrid': require('~/components/SubjectGrid').default

      props:
         'subjects':
            type: Array
            default: -> []

      data: ->
         'like':     ''
         'view':     'list'
         'types':    []
         'styles':   []
         'mainOpen': true

      methods:
         close: ->
            @mainOpen = false
            await @io.sleep(32)
            @$emit('close')
</script>



<style lang="less">

   @side-width: 360px;
   @padding:    20px;

   .SearchDialog {
      .Area {
         width: 85%;
         height: 80%;
         overflow: scroll;
         position: relative;

         .SearchSide {
            position: absolute;
            left: 0;
            top: 0;
            width: @side-width;
            height: 100%;
            padding: @padding;
            border-right: 1px solid #F2F2F2;
         }
         
         .main {
            margin-left: @side-width;
            padding: @padding;
         }
      }
   }
</style>