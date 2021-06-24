import axios from 'axios'

const getOrderModule = {
  state: {
    orders: '',
  },

  getters: {
    orders: state => state.orders
  },

  actions: {
    async get_Orders({commit}, data){
      try {
        const response = await axios.get('/v1/filter_order', {
                                    params: {
                                      status: data
                                    }
                                  })
        commit('SET_ORDERS', response.data)
      } catch (error) {
        console.log(error)
      }
    },

    async search_by_code({commit}, data){
      try {
        const response = await axios.get('/v1/looking_my_order', {
                                    params: {
                                      code: data
                                    }
                                  })
        commit('SEARCH_BY_CODE', response.data)
      } catch (error) {
        console.log(error)
      }
    },
  },

  mutations: {
    SET_ORDERS(state, object) {
      state.orders = object
    },

    SEARCH_BY_CODE(state, object) {
      state.orders = object
    }
  }
}

export default getOrderModule
