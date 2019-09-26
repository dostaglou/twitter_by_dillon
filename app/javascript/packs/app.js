import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import VueApollo from 'vue-apollo'
import ApolloClient from "apollo-boost"

import Index from './components/index.vue'

const apolloClient = new ApolloClient({
  uri: "http://localhost:3000/graphql"
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

Vue.use(VueApollo)

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
  ],
})

const app = new Vue({
  router,
  apolloProvider,
  el: '#app',
})
