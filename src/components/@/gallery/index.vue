<script lang="coffee">
  module.exports =
    props:
      'items':
        type: Array
        default: -> []
      'cols':
        type: Number
        default: 10
      'padding':
        type: Number
        default: 10

    render: (createElement) ->

      items = @$slots['default'] ? []
      items = items.slice(0, @cols)
      count = items.length
      needs = @cols - count

      children = [items...]
      for i in [0...needs]
        pad = createElement('div', {class: 'pad'})
        children.push(pad)

      children = children.map (child, i) =>
        style =
          width: 100 / @cols + '%'
          marginLeft: if i is 0 then 0 else @padding + 'px'
        return createElement('div', {class: 'item', style}, [child])

      return createElement('div', {class: 'gallery'}, children)
</script>


<style lang="less" scoped>
  .gallery{
    display: flex;
    .item{
      box-sizing: border-box;
      width: 14.28%;
      .pad{
        &::after{
          content: "　";
          display: block;
        }
      }
    }
  }
</style>