<template>
  <v-layout>
    <v-flex>
      <v-list>
        <v-list-tile v-for="atom in atoms" :key="atom">
          <v-list-tile-content>
            <atom :atom="atom" />
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-flex>
  </v-layout>
</template>

<script>
import Atom from '~/components/Atom.vue'

export default {
  middleware: ['auth'],
  components: {
    Atom
  },
  data () {
    return {
      atoms: []
    }
  },
  methods: {
    async updateAtoms () {
      this.atoms = await this.$axios.$get('/atoms');
    }
  },
  mounted () {
    this.updateAtoms();
  }
}
</script>
