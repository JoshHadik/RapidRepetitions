<template>
  <div class="atom">
    <h2>
      {{ atom.title }}
    </h2>

    <p class="atom--symbol">
      ({{ atom.symbol }})
    </p>

    <p>
      number of electrons: {{ atom.num_of_electrons }}
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
.atom--symbol {
  font-weight: 800;
}

</style>
