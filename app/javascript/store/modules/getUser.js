import axios from 'axios'

const getUserModule = {
  state: {
    user_login: {},
    current_user: {}
  },

  getters: {
    user_login: state => state.user_login,
    current_user: state => state.current_user
  },

  actions: {
    async getUserlogin({commit}) {
      try {
        const response = await axios.get('/v1/user_login')
        commit('SET_USER_LOGIN', response.data)
      } catch (error) {
        console.log(error)
      }
    },

    async getCurrentUser({commit}) {
      try {
        const response = await axios.get('/v1/current_user')
        commit('SET_CURRENT_USER', response.data)
      } catch (error) {
        console.log(error)
      }
    }
  },

  mutations: {
    SET_USER_LOGIN(state, user_login){
      state.user_login = user_login
    },

    SET_CURRENT_USER(state, current_user){
      state.current_user = current_user
    },
  }
}

export default getUserModule
