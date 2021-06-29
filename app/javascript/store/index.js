import Vue from 'vue'
import Vuex from 'vuex'

import getuser from './modules/getUser'
import getcity from './modules/getCity'
import getorder from './modules/getOrder'
import getcoin from './modules/getCoin'
import getroom from './modules/getRoom'

Vue.use(Vuex)

const storeData = {
  state: {
    showLayout:  true
  },

  mutations: {
    UNLAYOUT(state) {
      state.showLayout = !state.showLayout
    }
  },

  modules: {
    getuser,
    getcity,
    getorder,
    getcoin,
    getroom
  }
}

const store = new Vuex.Store(storeData)

export default store
