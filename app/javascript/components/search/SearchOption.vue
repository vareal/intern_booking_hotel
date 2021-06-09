<template>
  <div class="tileContainer-wrapper">
    <div class="WelcomeMessage">
      <div class="WelcomeMessage__wrapper">
        <h1>{{ select_form_search.h1 }}</h1>
        <h2 class="WelcomeMessage-H2">{{ select_form_search.h2 }}</h2>
      </div>
    </div>
    <div class="quickly-search">
      <ul class="search-colunm">
        <li class="search-item"
          v-for='(navbar, index) in navbars'
          :key='index'
          @click="select_form($event, index)"
          v-bind:class="class_select_form(index)"
        >
          <span v-html="navbar.icon"></span>
          <div class="content-search">
            <h6>{{ navbar.content }}</h6>
            <div
              v-bind:class="class_select_form(index)"
            >
            </div>
          </div>
        </li>
      </ul>
      <FormSreach/>
    </div>
  </div>
</template>
<script>
  import FormSreach from './FormSearch.vue'

export default {
  data: function(){
    return {
      selected_from: 1,
      WelcomeMessage: {
        h1: 'ĐẶT VÉ MÁY BAY TỐT NHẤT TRÊN AGODA NGAY HÔM NAY',
        h2: 'Nhanh chóng tìm và đặt hơn 200 hãng hàng không trên toàn thế giới'
      },
      navbars: [
        {
          icon: '<i class="fas fa-hotel"></i>',
          content: 'Khách sạn & Nhà',
          h1: 'KHÁCH SẠN, KHU NGHỈ DƯỠNG, NHÀ TRỌ & HƠN THẾ NỮA',
          h2: 'Nhận giá tốt nhất cho >2.000.000 chỗ nghỉ, trên toàn cầu'
        },
        {
          icon: '<i class="fas fa-warehouse"></i>',
          content: 'Chỗ ở riêng',
          h1: 'TÌM TỔ ẤM VỚI AGODA HOMES',
          h2: 'Rộng rãi hơn, chân thực hơn, nhiều lý do để đi du lịch hơn.'
        },
        {
          icon: '<i class="fas fa-building"></i><i class="fas fa-plane"></i>',
          content: 'Chuyến bay + K.sạn',
          h1: 'KHÁCH SẠN, KHU NGHỈ DƯỠNG, NHÀ TRỌ & HƠN THẾ NỮA',
          h2: 'Nhận giá tốt nhất cho >2.000.000 chỗ nghỉ, trên toàn cầu'
        },
        {
          icon: '<i class="fas fa-plane"></i>',
          content: 'Chuyến bay',
          h1: 'ĐẶT VÉ MÁY BAY TỐT NHẤT TRÊN AGODA NGAY HÔM NAY',
          h2: 'Nhanh chóng tìm và đặt hơn 200 hãng hàng không trên toàn thế giới'
        },
        {
          icon: '<i class="far fa-calendar-alt"></i>',
          content: 'Ở theo tháng',
          h1: 'KHÁCH SẠN, KHU NGHỈ DƯỠNG, NHÀ TRỌ & HƠN THẾ NỮA',
          h2: 'Nhận giá tốt nhất cho >2.000.000 chỗ nghỉ, trên toàn cầu'
        }
      ]
    }
  },
  methods: {
    select_form(event, index) {
      this.selected_from = index
    },
    class_select_form(index) {
      return {
        selected: this.selected_from === index
      }
    }
  },
  computed: {
    select_form_search() {
      let index = this.selected_from
      return this.navbars[index]
    }
  },
  components: {
    FormSreach
  }
}
</script>
