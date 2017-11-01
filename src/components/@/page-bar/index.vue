<template lang="jade">
  .page-bar(v-if="maxPage > 1")
    text-button.prev(
      v-show="currentPage > 1",
      text="Prev",
      @click.native="prev"
    )
    page-button(
      v-for="page in pages",
      :key="page",
      :page="page",
      :disabled="page === currentPage"
      @click.native="skip(page)"
    )
    text-button.next(
      v-show="currentPage < maxPage",
      text="Next",
      @click.native="next"
    )
    text-button.last(
      v-show="currentPage < maxPage",
      text="Last",
      @click.native="last"
    )
</template>


<script lang="coffee">
  module.exports =
    components:
      'page-button': require('./page-button')
      'text-button': require('./text-button')

    props:
      'page':
        type: Number
        required: true
      'size':
        type: Number
        required: true
      'total':
        type: Number
        required: true

    computed:
      currentPage: -> @page
      maxPage:     -> Math.ceil(@total / @size)

      pages: ->
        pages = []
        startPage = parseInt((@currentPage - 1) / 10) * 10
        for i in [1..10]
          page = startPage + i
          if page <= @maxPage
            pages.push(page)
          else
            break
        return pages

    methods:
      prev: ->
        if @currentPage > 1
          @$emit('change', @currentPage - 1)

      next: ->
        if @currentPage < @maxPage
          @$emit('change', @currentPage + 1)

      last: ->
        if @currentPage < @maxPage
          @$emit('change', @maxPage)

      skip: (page) ->
        if page >= 1 and page <= @maxPage and page isnt @currentPage
          @$emit('change', page)
</script>


<style lang="less" scoped>

  @padding: 5px;

  .page-bar{
    display: flex;
    align-items: center;
    .text-button.prev{
      margin-right: @padding;
    }
    .page-button{
      margin-left:  @padding;
      margin-right: @padding;
    }
    .text-button.next{
      margin-left:  @padding;
      margin-right: @padding;
    }
    .text-button.last{
      margin-left:  @padding;
    }
  }
</style>