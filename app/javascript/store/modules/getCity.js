import axios from 'axios'

const getCityModule = {
  state: {
    cities: {}
  },

  getters: {
    cities: state => state.cities
  },

  actions: {
    async get_listCities({commit}) {
      try {
        const response = await axios.get('/v1/list_city')
        commit('SET_CTIES', response.data)
      } catch (error) {
        console.log(error)
      }
    }
  },

  mutations: {
    SET_CTIES(state, cities) {
      state.cities = cities
    }
  }
}

export default getCityModule
