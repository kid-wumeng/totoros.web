<script lang="coffee">
  module.exports =
    props:
      'sep':
        type: String
        default: '、'
      'padding':
        type: Number
        default: 0

    render: (createElement) ->
      items = @$slots['default'] ? []
      children = []

      for item, i in items
        if item.tag
          children.push(item)
          if i isnt items.length-1
            style =
              paddingLeft:  @$props.padding + 'px'
              paddingRight: @$props.padding + 'px'
            sep = createElement('span', {class: 'sep', style}, @$props.sep)
            children.push(sep)

      if item
        if !item.tag
          children.pop()

      return createElement('span', {class: 'sep-row'}, children)
</script>


<style lang="less" scoped>
  .sep-row{
    display: flex;
    align-items: center;
    >.sep{
      color: #A2AEBA;
    }
  }
</style>