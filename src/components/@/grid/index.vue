<template lang="jade">
  .grid
    slot
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .grid{
    display: flex;
    flex-wrap: wrap;
    >*{
      box-sizing: border-box;
    }
  }
</style>