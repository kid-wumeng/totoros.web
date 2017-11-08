<template lang="jade">
  .face
    person-face(:person="person" frame prevent @click="editFace")
</template>


<script lang="coffee">
  module.exports =
    components:
      'person-face': require('components/image/person-face')

    props:
      'person':
        type: Object
        required: true

    methods:
      editFace: ->
        @dispatch('wiki-face-modal/show', {type: 'person', id: @person.id})
</script>


<style lang="less">
  .face{
    display: flex;
    justify-content: center;
    .person-face{
      width: 160px;
    }
  }
</style>
