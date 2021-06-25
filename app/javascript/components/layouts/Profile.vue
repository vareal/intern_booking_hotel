<template lang="">
  <div class="container-agoda">
    <div class="row">
      <div class="col-md-3 mmb-left-pane">
        <div class=" mmb-menu-component">
          <ul>
            <li class="mmb-menu-topitem"
              v-for="(option, id) in options" :key="option.id"
              @click="select_option($event, option.id)"
              v-bind:class="active_option(option.id)"
            >
              <router-link :to="{ name: option.url, params: { id: option.id } }">
                <span v-html="option.icon"></span>
                <span class="content">{{ option.content }}</span>
              </router-link>
              <ul class="SubItems__Container"></ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-md-9" v-if="choose_option == 1">
        <OrderHistory/>
      </div>
      <div class="col-md-9" v-else-if="choose_option == 4">
        <Coin/>
      </div>
      <div class="col-md-9" v-else>
      </div>
    </div>
  </div>
</template>
<script>
  import OrderHistory from '../orders/OrderHistory.vue'
  import Coin from '../payment/Coin.vue'
  import {mapGetters} from 'vuex'

  export default {
    data() {
      return {
        choose_option: this.$route.params.id,
        options: [
          {
            id: 1,
            url:'OrderHistory',
            content: 'Đơn đặt chỗ của tôi',
            icon: '<i class="far fa-calendar"></i>'
          },
          {
            id: 2,
            content: 'Hộp thư',
            icon: '<i class="far fa-comment-alt"></i>'
          },
          {
            id: 3,
            content: 'Nhận xét',
            icon: '<i class="far fa-star"></i>'
          },
          {
            id: 4,
            url: 'Coin',
            content: 'Ví Agoda',
            icon: '<i class="fas fa-money-check-alt"></i>'
          },
          {
            id: 5,
            content: 'Hồ sơ',
            icon: '<i class="far fa-user"></i>'
          },
        ]
      }
    },

    methods:{
      select_option(event, index) {
          this.choose_option = index
        },

      active_option(index) {
        return {
          active: this.choose_option === index
        }
      },
    },

    computed: {
      selected_option() {
        let index = this.choose_option
        return this.options[index]
      },
    },

    components: {
      OrderHistory,
      Coin
    }
  }
</script>
