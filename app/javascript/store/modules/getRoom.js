import axios from 'axios'

const getRoomModule = {
  state: {
    rooms: '',
    name_room: ''
  },

  getters: {
    rooms: state => state.rooms
  },

  actions: {
    async get_Room({commit}, data){
      try {
        const response = await axios.get('/v1/search_room', {
                                    params: {
                                      q: data
                                    }
                                  })
        commit('SET_ROOM', response.data)
      } catch (error) {
        console.log(error)
      }
    },
  },

  mutations: {
    SET_ROOM(state, data) {
      state.rooms = data
    },

    SET_ROOM_NAME(state, data) {
      state.name_room = data
    }
  }
}

export default getRoomModule
