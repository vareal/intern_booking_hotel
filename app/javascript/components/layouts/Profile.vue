<template lang="">
  <div class="container-agoda">
    <div class="row">
      <div class="col-md-3 mmb-left-pane">
        <div class=" mmb-menu-component">
          <ul>
            <li class="mmb-menu-topitem"
              v-for="(option, index) in options" :key="index"
              @click="select_option($event, index)"
              v-bind:class="active_option(index)"
            >
              <router-link :to="{ name: option.url }">
                <span v-html="option.icon"></span>
                <span class="content">{{ option.content }}</span>
              </router-link>
              <ul class="SubItems__Container"></ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-md-9" v-if="choose_option == 0">
        <OrderHistory/>
      </div>
      <div class="col-md-9" v-else>
      </div>
    </div>
  </div>
</template>
<script>
  import OrderHistory from '../orders/OrderHistory.vue'

  export default {
    data() {
      return {
        choose_option: 0,
        options: [
          {
            url:'OrderHistory',
            content: 'Đơn đặt chỗ của tôi',
            icon: '<i class="far fa-calendar"></i>'
          },
          {
            content: 'Hộp thư',
            icon: '<i class="far fa-comment-alt"></i>'
          },
          {
            content: 'Nhận xét',
            icon: '<i class="far fa-star"></i>'
          },
          {
            content: 'Ví Agoda',
            icon: '<i class="fas fa-money-check-alt"></i>'
          },
          {
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
      }
    },

    components: {
      OrderHistory
    }
  }
</script>
