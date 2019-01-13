<template>
  <div class="atom">
    <p>
      <strong>
        {{atom.name}}
      </strong>
      ({{atom.symbol}})
    </p>
    <p>
      - {{atom.num_of_electrons}} electrons.
    </p>
  </div>
</template>

<script>
export default {
  props: [
    "atom"
  ]
}
</script>

<style>

.atom p {
  display: inline-block;
}
</style>
