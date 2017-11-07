<template lang="jade">
  .load-trigger
</template>


<script lang="coffee">
  module.exports =

    data: ->
      loaded: false

    mounted: ->
      if @shouldLoad()
         @load()
      else
         window.addEventListener('scroll', @onScroll)

    methods:
      deinit: ->
        if @loaded
          window.removeEventListener('scroll', @onScroll)

      onScroll: ->
        if @shouldLoad()
           @load()

      shouldLoad: ->
        scrollTop = window.pageYOffset ? document.documentElement.scrollTop ? document.body.scrollTop
        viewportHeight = window.innerHeight ? document.documentElement.clientHeight ? document.body.clientHeight
        diff = scrollTop + viewportHeight - @$el.offsetTop
        if diff > 0
          return true
        return false

      load: ->
        window.removeEventListener('scroll', @onScroll)
        @loaded = true
        @$emit('load')
</script>