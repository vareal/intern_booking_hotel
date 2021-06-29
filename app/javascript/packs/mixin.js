import Vue from "vue";

Vue.mixin({
  data() {
    return {
      name_room: ''
    }
  },

  methods: {
    get_room(data){
      this.$router.replace({
              name: 'SearchPage',
              params: {
                name: this.name_room
              },
              query: {
                name: this.name_room
              }
          })

      this.$store.dispatch('get_Room', data)
      this.$store.commit('SET_ROOM_NAME', data)
    },

    total_person() {
      return parseInt(localStorage.old_person) + parseInt(localStorage.child_person)
    },
  },

  filters: {
    format_price: function(price){
      return price.toLocaleString('it-IT',
                                  {style : 'currency',
                                  currency : 'VND'});
      },

    format_date: function(date){
      let datetime = new Date(date)
      return datetime.toLocaleDateString()
    }
  }
});
