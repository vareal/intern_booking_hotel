const format = {
  state: {
    checkin_time: '',
    checkout_time: '',
    money: ''
  },

  getters: {
    checkin_time: state => state.checkin_time,
    checkout_time: state => state.checkout_time,
    money: state => state.money
  },

  actions: {
    format_date_checkin_time({commit}, checkin_time){
      let checkin = new Date(checkin_time)
      let format_checkin = checkin.toLocaleDateString()
      commit('SET_FORMAT_CHECKIN_TIME', format_checkin)
    },

    format_date_checkout_time({commit}, checkout_time){
      let checkout = new Date(checkout_time)
      let format_checkout = checkout.toLocaleDateString()
      commit('SET_FORMAT_CHECKOUT_TIME', format_checkout)
    },

    format_money({commit}, money) {
      let formated_money = money.toLocaleString('it-IT',
                                                        {style : 'currency',
                                                        currency : 'VND'});
      commit('SET_FORMAT_MONEY', formated_money)
    }
  },

  mutations: {
    SET_FORMAT_CHECKIN_TIME(state, checkin_time) {
      state.checkin_time = checkin_time
    },

    SET_FORMAT_CHECKOUT_TIME(state, checkout_time) {
      state.checkout_time = checkout_time
    },

    SET_FORMAT_MONEY(state, money) {
      state.money = money
    }
  }
}

export default format
