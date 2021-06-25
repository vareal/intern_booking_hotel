import Vue from 'vue'
import Vuex from 'vuex'

import getuser from './modules/getUser'
import format from './modules/format'
import getcity from './modules/getCity'
import getorder from './modules/getOrder'
import getcoin from './modules/getCoin'

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
    format,
    getcity,
    getorder,
    getcoin
  }
}

const store = new Vuex.Store(storeData)

export default store
