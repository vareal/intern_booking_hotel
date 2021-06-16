import Vue from 'vue'
import Vuex from 'vuex'

import getuser from './modules/getUser'

Vue.use(Vuex)

const storeData = {
  modules: {
    getuser
  }
}

const store = new Vuex.Store(storeData)

export default store
