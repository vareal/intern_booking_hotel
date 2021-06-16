<template>
  <div class="booking-room">
    <LayoutsHeaderBooking/>
    <div class="main">
      <div class="container container--sm">
        <div class="row">
          <div class="col-md-6 col-xs-12">
            <div>
              <div class="title">
                <h3>Thông tin đặt chỗ</h3>
              </div>
              <div class="space--loose">
                <div class="input-wraper">
                  <label class="input-wraper__label bold is-block">
                    <span class="text-danger">*</span>
                    Số khách
                  </label>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="py--12 px--18 bg-white is-shadow-box">
                        1 Khách
                      </div>
                    </div>
                  </div>
                </div>
                <div class="input-wraper">
                  <label class="input-wraper__label bold is-block">
                    Name Room
                  </label>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="p--12 is-shadow-box rounded bg-white">
                        <div class="is-decorate is-green"></div>
                        <p class="c-gray-9 mb--0">Nhận phòng</p>
                        <p class="p--giant mb--0">{{ checkin_time }}</p>
                        <p class="p--small-2 c-gray-9 mb--0">
                          {{getDay(check_in)}}
                        </p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="p--12 is-shadow-box rounded bg-white">
                        <div class="is-decorate is-orange"></div>
                        <p class="c-gray-9 mb--0">Trả phòng</p>
                        <p class="p--giant mb--0">{{ checkout_time }}</p>
                        <p class="p--small-2 c-gray-9 mb--0">
                          {{getDay(check_out)}}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="input-wraper"></div>
                <div class="input-wraper"></div>
              </div>
              <button class="btn payment" @click="bookingRoom($event)"> Thanh toán </button>
            </div>
          </div>
          <div class="col-lg-2 col-md-1"></div>
          <div class="col-md-5 col-lg-4 col-xs-12 d-none d-md-block">
            <div class="h--100">
              <div class="title">
                <h3>Chi tiết đặt phòng</h3>
              </div>
              <div class="checkup checkup--sticky">
                <div class="checkup__header">
                  <a href="#" class="is-flex">
                    <div class="grow">
                      <h4 class="checkup__title">Tên Phòng</h4>
                      <div class="checkup__add">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Hoàn Kiếm, Hà Nội, Vietnam</span>
                      </div>
                    </div>
                    <div style="width: 128px;">
                      <div class="bg-img bg-img--85 radius-xs"></div>
                    </div>
                  </a>
                </div>
                <div class="checkup__body">
                  <div class="checkup__detail">
                    <div class="is-flex middle-xs">
                      <span>
                        <img src="./pic2.svg">
                      </span>
                      <span class="content">
                        <b>{{ quatityday }} đêm</b>
                        {{ checkin_time }} - {{ checkout_time }}
                      </span>
                    </div>
                    <div class="is-flex middle-xs">
                      <span>
                        <img src="./pic1.svg">
                      </span>
                      <span class="content"> 2 người </span>
                    </div>
                  </div>
                  <div class="checkup__price fadeIn">
                    <div class="middle-xs between-xs">
                      <div class="is-flex align-center">
                        <span class="pr--6">Giá thuê {{ money }} đêm</span>
                        <span>{{ money }}</span>
                      </div>
                    </div>
                  </div>
                  <hr class="my--18">
                  <div class="total-price fadeIn">
                    <div class="middle-xs between-xs">
                      <div class="is-flex align-center">
                        <span class="extra-bold">Tổng tiền</span>
                        <span class="extra-bold">{{ money }}</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="checkup__footer"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import LayoutsHeaderBooking from './LayoutHeaderBooking'
  import {mapGetters} from 'vuex'

  export default {
    data() {
      return {
        check_in: localStorage.check_in,
        check_out: localStorage.check_out,
        quatityday: localStorage.quatityday,
        total_price: localStorage.quatityday * localStorage.price,
        room_id: localStorage.room_id
      }
    },

    methods: {
      bookingRoom(event){
        try {
          this.$axios.post('/v1/orders', {
            order: {
              time_checkin: this.check_in,
              time_checkout: this.check_out,
              total_price: this.total_price,
              room_id: this.room_id
            }
          })
        } catch (error) {
          console.log(error)
        }

        this.redirect_to_after_create()
        this.remove_store_after_create()
      },

      redirect_to_after_create(){
        this.$router.push('/')
        location.reload()
      },

      remove_store_after_create(){
        let keysToRemove = ["check_in", "check_out", "quatityday", "price",
          "room_id"];
        keysToRemove.forEach(k => localStorage.removeItem(k))
      },

      getDay(day){
        var d = new Date(day);
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day_date = weekday[d.getDay()]

        return day_date
      }
    },

    mounted(){
      this.$store.commit('UNLAYOUT')
      this.$store.dispatch('format_date_checkin_time', this.check_in)
      this.$store.dispatch('format_date_checkout_time', this.check_out)
      this.$store.dispatch('format_money', this.total_price)
    },

    computed:{
      ...mapGetters(['checkin_time', 'checkout_time', 'money'])
    },

    components:{
      LayoutsHeaderBooking
    }
  }
</script>
