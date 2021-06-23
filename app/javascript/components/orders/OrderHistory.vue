<template lang="">
  <div id="mmb-bookings-page">
    <div class="my-bookings-filter">
      <div class="filter-container filter-count-3">
        <span class="filter-option"
          v-for="(filter_option, index) in filter_options" :key="index"
          @click="select_filter($event, index)"
          v-bind:class="active_filter(index)"
        >
          {{ filter_option.name }}
        </span>
        <span class="seperator"></span>
      </div>
      <div class="block-switch">
        <div class="switch-title"> Sắp xếp theo </div>
        <div class="switch-option"
          v-for="(order, index) in orders_date" :key="index"
          @click="select_order($event, index)"
          v-bind:class="active_order(index)"
        >
          {{ order.name }}
        </div>
      </div>
      <div class="search-booking">
        <div class="group-form">
          <label>
            <span class="sc-title">Mã số đặt phòng</span>
          </label>
          <input class="search-booking-by-id-input" type="number"
            placeholder="Mã đặt phòng" min="1" max="10"
            v-model="order_code"
          >
        </div>
        <div class="button-submit">
          <button class="btn btn-pimare"
            :disabled="order_code == ''"
            :class="{unactive: order_code === '' }"
            @click="search_code(order_code)"
          >
            Tìm
          </button>
        </div>
      </div>
    </div>
    <div class="booking-list">
      <div v-if="orders.length > 0">
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Mã đặt phòng</th>
              <th scope="col">Ngày nhận phòng</th>
              <th scope="col">Ngày trả phòng</th>
              <th scope="col">Giá</th>
              <th scope="col">Trạng thái</th>
              <th scope="col">Xem chi tiết</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(order, index) in orders" :key="index">
              <th scope="row">{{ index + 1 }}</th>
              <td>{{ order.code }}</td>
              <td>{{ order.time_checkin }}</td>
              <td>{{ order.time_checkout }}</td>
              <td>{{ order.total_price }}</td>
              {{ status_badges(order.status) }}
              <td class="status_order">
                <span class="badge rounded-pill badge"
                  :class="badges"p
                >
                  {{ title }}
                </span>
              </td>
              <td>
                <i class="far fa-eye" style="color: rgb(83, 146, 249)">
                </i>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="no-booking-panel" v-if="orders.length == 0 ">
        <div class="no-booking-content">
          <h3>Quý khách không có đơn đặt chỗ</h3>
          <p>Không tìm thấy đơn đặt chỗ của quý khách</p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'

  export default {
    data() {
      return {
        choose_option: 0,
        choose_order: 0,
        filter_options: [
          {name: 'Sắp tới'},
          {name: 'Hoàn tất'},
          {name: 'Đã huỷ'}
        ],
        orders_date: [
          {name: 'Ngày đặt phòng'},
          {name: 'Ngày nhận phòng'},
        ],

        title: '',
        badges: '',
        order_code: ''
      }
    },

    methods:{
      select_filter(event, index) {
        this.choose_option = index
        this.get_order(index)
      },

      active_filter(index) {
        return {
          active: this.choose_option === index
        }
      },

      select_order(event, index) {
        this.choose_order = index
      },

      active_order(index) {
        return {
          "option-selected": this.choose_order === index
        }
      },

      get_order(index) {
        this.$store.dispatch('get_Orders', index)
      },

      status_badges(status){
        switch (status) {
          case "approved":
            this.title = "Đang mượn phòng"
            this.badges = "bg-info"
            break;
          case "returned":
            this.title = "Đã trả phòng"
            this.badges = "badge-secondary"
            break;
          case "canceled":
            this.title = "Đã huỷ phòng"
            this.badges = "bg-danger"
            break;
        }
      },

      search_code(code) {
        this.$store.dispatch('search_by_code', code)
      },
    },

    computed: {
      selected_option() {
        let index = this.choose_option
        return this.filter_options[index]
      },

      selected_option() {
        let index = this.choose_order
        return this.orders_date[index]
      },

      ...mapGetters(['orders'])
    },

    mounted(){
      this.$store.dispatch('get_Orders', 0)
    }
  }
</script>
