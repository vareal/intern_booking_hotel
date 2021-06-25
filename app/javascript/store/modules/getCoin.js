import axios from 'axios'

const getCoinModule = {
  state: {
    coins: '',
    using_coin: 0
  },

  getters: {
    coins: state => state.coins,
    using_coin: state => state.using_coin
  },

  actions: {
    async get_Coins({commit}){
      try {
        const response = await axios.get('/v1/get_coin_in_wallet')
        commit('SET_COIN', response.data)
      } catch (error) {
        console.log(error)
      }
    },
  },

  mutations: {
    SET_COIN(state, data) {
      state.coins = data
    },

    SET_USING_COIN(state, data) {
      state.using_coin = data
    }
  }
}

export default getCoinModule
