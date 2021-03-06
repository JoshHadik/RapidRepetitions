module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'Iron Clad Dragon',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Iron Clad Dragon View' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Modules
  */
  modules: [
    "@nuxtjs/vuetify",
    "@nuxtjs/axios",
    "@nuxtjs/auth"
  ],
  /*
  ** Axios
  */
  axios: {
    host: 'localhost',
    port: 4000,
    prefix: '/api'
  },
  /*
  ** Auth
  */
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: { url: "/auth/users/sign_in" },
          logout: { url: "/auth/users/sign_out" },
          user: { url: "/auth/users/current" }
        }
      }
    }
  },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  }
}
