<template>
  <section class="container">
    <h1>
      Atoms
    </h1>

    <div class="atoms" v-for="atom in atoms" :key="atom">
      <atom :atom="atom" />
    </div>
  </section>
</template>

<script>
import Atom from '~/components/Atom.vue'

export default {
  components: {
    Atom
  },
  data () {
    return {
      atoms: []
    }
  },
  methods: {
    async updateAtoms() {
      this.atoms = await this.$axios.$get("/atoms")
    }
  },
  mounted () {
    this.updateAtoms()
  }
}
</script>
