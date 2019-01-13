<template>
  <div id="app">
    <v-app>
      <v-toolbar app dark class="red">
        <v-toolbar-title>
          Iron Clad Dragon
        </v-toolbar-title>
        <v-spacer />
        <v-btn icon nuxt href="/">
          <v-icon>home</v-icon>
        </v-btn>
        <v-btn icon nuxt href="/login">
          <v-icon>person</v-icon>
        </v-btn>
      </v-toolbar>
      <v-content>
        <v-container fluid>
          <nuxt/>
        </v-container>
      </v-content>
    </v-app>
  </div>
</template>

<style>
.button--green {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #3b8070;
  color: #3b8070;
  text-decoration: none;
  padding: 10px 30px;
}

.button--green:hover {
  color: #fff;
  background-color: #3b8070;
}

.button--grey {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #35495e;
  color: #35495e;
  text-decoration: none;
  padding: 10px 30px;
  margin-left: 15px;
}

.button--grey:hover {
  color: #fff;
  background-color: #35495e;
}
</style>
