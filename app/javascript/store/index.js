import Vue from 'vue'
import Vuex from 'vuex'

import getuser from './modules/getUser'

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
    getuser
  }
}

const store = new Vuex.Store(storeData)

export default store
