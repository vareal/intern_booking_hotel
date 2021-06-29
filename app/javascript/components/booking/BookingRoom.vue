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
                        {{ total_person() }} Khách
                      </div>
                    </div>
                  </div>
                </div>
                <div class="input-wraper">
                  <label class="input-wraper__label bold is-block">
                    {{ room_name }}
                  </label>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="p--12 is-shadow-box rounded bg-white">
                        <div class="is-decorate is-green"></div>
                        <p class="c-gray-9 mb--0">Nhận phòng</p>
                        <p class="p--giant mb--0">{{ check_in | format_date }}</p>
                        <p class="p--small-2 c-gray-9 mb--0">
                          {{getDay(check_in)}}
                        </p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="p--12 is-shadow-box rounded bg-white">
                        <div class="is-decorate is-orange"></div>
                        <p class="c-gray-9 mb--0">Trả phòng</p>
                        <p class="p--giant mb--0">{{ check_out | format_date  }}</p>
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
              <button class="btn payment" @click="bookingRoom($event)">
                Thanh toán
              </button>
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
                      <h4 class="checkup__title">{{ room_name }}</h4>
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
                        {{ check_in | format_date  }} -
                        {{ check_out | format_date }}
                      </span>
                    </div>
                    <div class="is-flex middle-xs">
                      <span>
                        <img src="./pic1.svg">
                      </span>
                      <span class="content"> {{ total_person() }} người </span>
                    </div>
                  </div>
                  <div class="checkup__price fadeIn">
                    <div class="middle-xs between-xs">
                      <div class="is-flex align-center">
                        <span class="pr--6">Giá thuê {{ quatityday }} đêm</span>
                        <span>{{ before_price | format_price }}</span>
                      </div>
                      <div class="is-flex align-center coin-mark">
                        <span class="pr--6"  @click="active_modal()">
                          Sử dụng coin
                          <span class="using-coin">
                            <i class="fas fa-search-dollar"></i>
                          </span>
                        </span>
                        <span>
                          {{ using_coin | format_price }}
                        </span>
                      </div>
                    </div>
                  </div>
                  <hr class="my--18">
                  <div class="total-price fadeIn">
                    <div class="middle-xs between-xs">
                      <div class="is-flex align-center">
                        <span class="extra-bold">Tổng tiền</span>
                        <span class="extra-bold">
                          {{ total_price | format_price }}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="checkup__footer">
                  <div class="input-group-foot">
                    <label class="input-group__label bold is-block">
                      Chính sách hủy phòng
                    </label>
                    <span class="input-group__text">
                      <b>Nghiêm ngặt</b>
                      : Hoàn lại 50% giá trị đặt phòng khi khách hàng huỷ phòng
                      trong vòng 48h sau khi đặt phòng thành công và trước 14
                      ngày so với thời gian check-in. Sau đó, hủy phòng trước
                      14 ngày so với thời gian check-in, được hoàn lại 50% tổng
                      số tiền đã trả (trừ phí dịch vụ).
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal"
      v-if="active == true"
      :class="{'is-active': active }"
    >
      <div class="modal-background"></div>
      <div class="modal-content">
        <div class="giftcards-content">
          <div class="giftcard-summary-image-container">
            <img class="giftcard-summary-image" src="../payment/gift.png">
          </div>
          <div class="giftcard-info">
            <ul class="list-table">
              <li>
                <span>Tổng số dư hiện tại:</span>
                <span class="giftcard-balance-value">
                  {{ coins | format_price }}
                </span>
              </li>
            </ul>
            <div class="group-form">
              <label>
                <span class="sc-title">Số tiền bạn muốn sử dụng</span>
              </label>
              <input class="search-booking-by-id-input" type="number"
                placeholder="Nhập số tiền" min="1" :max="coins"
                v-model="payed_coin"
              >
              <button class="button"
                :disabled="payed_coin == ''"
                @click="save_coin_using()"
              >
                Sử dụng
              </button>
            </div>
          </div>
        </div>
      </div>
      <button class="modal-close is-large"
        aria-label="close"
        @click="active = !active"
      ></button>
    </div>
  </div>
</template>
<script>
  import LayoutsHeaderBooking from './LayoutHeaderBooking'
  import {mapGetters} from 'vuex'

  export default {
    data() {
      return {
        room_name: localStorage.name_room,
        check_in: localStorage.check_in,
        check_out: localStorage.check_out,
        quatityday: localStorage.quatityday,
        price: localStorage.price,
        total_price: localStorage.quatityday * localStorage.price,
        room_id: localStorage.room_id,
        active: false,
        payed_coin: '',
        old_person: localStorage.old_person,
        child_person: localStorage.child_person
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
              room_id: this.room_id,
              coin_using: this.$store.getters.using_coin,
              capacity_adult: this.old_person,
              capacity_child: this.child_person
            }
          })
        } catch (error) {
          console.log(error)
        }

        this.redirect_to_after_create()
        this.remove_store_after_create()
      },

      redirect_to_after_create(){
        this.$swal({
          position: 'top-end',
          icon: 'success',
          title: 'Đặt phòng thành công',
          showConfirmButton: false,
          timer: 2000
        })

        this.$router.push('/')
      },

      remove_store_after_create(){
        let keysToRemove = ["name_room","check_in", "check_out", "quatityday", "price",
          "room_id", "coin_using", "old_person", "child_person"];
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
      },

      active_modal() {
        this.active = !this.active
      },

      save_coin_using() {
        localStorage.coin_using  = this.payed_coin
        this.$store.commit('SET_USING_COIN', localStorage.coin_using)
        this.total_price -= this.$store.getters.using_coin
        this.active_modal()
      }
    },

    mounted(){
      this.$store.commit('UNLAYOUT')
      this.$store.dispatch('get_Coins')
    },

    computed:{
      before_price() {
        return this.price * this.quatityday
      },
      ...mapGetters(['coins', 'using_coin']),
    },

    components:{
      LayoutsHeaderBooking
    }
  }
</script>
