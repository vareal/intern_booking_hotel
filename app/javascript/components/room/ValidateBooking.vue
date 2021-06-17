<template>
  <div>
    <div class="room-sidebar__pricing">
        <p class="fadeIn">
          <span class="extra-bold">
            {{ total_price | format_price }}
          </span>
          <span class="p--small">/{{quatityday}}đêm</span>
        </p>
      </div>
    <div class="picker-date">
      <div class="pick-time time-check-in">
        <input type="date" class="form-control check-in"
          v-model="check_in"
        >
      </div>
      <p>
        đến
      </p>
      <div class="pick-time time-check-out">
        <input type="date" class="form-control check-out"
          v-model="check_out"
          @change="quatity_day()"
        >
      </div>
    </div>
    <div class="submit-booking-room">
      <div class="needLogin" v-if="user_login">
        <router-link :to="{ name: 'BookingRoom', params: { id: room.id }}"
          class="button button-b"
        >
          Đặt ngay
        </router-link>
      </div>
      <div class="needLogin" v-else>
        <router-link to="/auth/login"
          class="button button-b"
        >
          Login to booking room
        </router-link>
      </div>
    </div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  import {required} from 'vuelidate/lib/validators'

  export default {
    props: {
      room: Object
    },

    data() {
      return {
        check_in: '',
        check_out: '',
        quatityday: 1,
        totalPrice: '',
      }
    },

    mounted() {
      if (localStorage.check_in) {
        this.check_in = localStorage.check_in;
      }

      if (localStorage.check_out) {
        this.check_out = localStorage.check_out;
      }
    },

    methods: {
      quatity_day(){
        var a = new Date(this.check_in)
        var b = new Date(this.check_out)
        var difference = Math.abs(a - b);
        this.quatityday = difference/(1000 * 3600 * 24)
        localStorage.quatityday = this.quatityday
        localStorage.room_id = this.room.id
        localStorage.price = this.room.price
      }
    },

    watch: {
      check_in(newValue) {
        localStorage.check_in = this.check_in;
      },

      check_out(newValue){
        localStorage.check_out = this.check_out;
      }
    },

    computed: {
      total_price(){
        if(localStorage.quatityday){
          this.quatityday = localStorage.quatityday
        }
        return this.totalPrice = this.quatityday * this.room.price
      },
      ...mapGetters(['user_login', 'current_user'])
    },

    filters: {
      format_price: function(price){
        return price.toLocaleString(
          'vi', {style : 'currency', currency : 'VND'}
        );
      }
    },

    validations: {
      check_in: {
        required
      },
      check_out: {
        required
      }
    }
  }
</script>
<style lang="">

</style>
