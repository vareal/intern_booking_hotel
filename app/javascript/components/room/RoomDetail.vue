<template lang="">
  <div>
    <StickyHeader v-bind:room="room"/>
    <div class="container-custom container">
      <ul class="BreadCrumb-hotel">
        <li class="BreadCrumb-hotel_item">
          <div>
            <router-link to="/" class="breadcrumb-link">
              <div class="breadcrumb-regionName">Trang chủ</div>
            </router-link>
          </div>
        </li>
        <li class="BreadCrumb-hotel_item">
          <div class="breadcrumb-connector"> > </div>
        </li>
        <li class="BreadCrumb-hotel_item">
          <div>
            <router-link to="/" class="breadcrumb-link"
              v-for="city in room"
            >
              <div class="breadcrumb-regionName"> {{ city.name }}</div>
            </router-link>
          </div>
        </li>
        <li class="BreadCrumb-hotel_item">
          <div class="breadcrumb-connector"> > </div>
        </li>
        <li class="BreadCrumb-hotel_item">
          <div>
            <router-link to="/" class="breadcrumb-link">
              <div class="breadcrumb-regionName">{{ room.name }}</div>
            </router-link>
          </div>
        </li>
      </ul>
      <div class="main-content">
        <div class="row">
          <div class="col-md-8 col-xs-12">
            <slick class="list-images-for-room">
              <div class="image-item">
                <img src="https://cdn.luxstay.com/users/230114/-t-sgFu3O7GNt9v01XmcYFiU.jpg">
              </div>
              <div class="image-item">
                <img src="https://cdn.luxstay.com/users/230114/-t-sgFu3O7GNt9v01XmcYFiU.jpg">
              </div>
              <div class="image-item">
                <img src="https://cdn.luxstay.com/users/230114/-t-sgFu3O7GNt9v01XmcYFiU.jpg">
              </div>
            </slick>
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div>
                    <div class="title">
                      <div class="row">
                        <div class="col-xs-12 col-sm-10 paddingRoomName">
                          <h1 class="break-word">{{ room.name }}</h1>
                        </div>
                        <div class="d-none d-sm-block col-lg-2 text-right room-id">
                          <div class="host-intro__wrap">
                            <a href="#">
                              <div class="image-box image-box--circle">
                                <img src="https://bloganh.net/wp-content/uploads/2020/05/cach-tao-dang-quay-lung-voi-ong-kinh.jpg">
                              </div>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="detail__location">
                      <div>
                        <i class="fas fa-map-marker-alt"></i>
                        <span class="ml--6 bold">Việt Nam</span>
                      </div>
                    </div>
                    <div class="mt--12">
                      <i class="fas fa-building"></i>
                      <span class="ml--6 bold">Biệt Thự</span>
                      <span class="acreage">
                        -  25 m <sup>2</sup>
                      </span>
                    </div>
                    <div class="detail__type">
                      <div>
                        <p class="mb--0">
                          <span>Phòng riêng · </span>
                          <span>1 Phòng tắm · </span>
                          <span>1 Giường ngủ · </span>
                          <span>1 Phòng khách · </span>
                          <span>2 Khách (Tối đa 2 khách)</span>
                        </p>
                      </div>
                    </div>
                    <div class="main-service">
                      <ul class="service-list">
                        <li class="service-item">
                          <i class="fas fa-car"></i>
                          <p class="text-service">
                            Đưa đón
                          </p>
                        </li>
                        <li class="service-item">
                          <i class="fas fa-wifi"></i>
                          <p class="text-service">
                            Wi-Fi miễn phí trong tất cả các phòng!
                          </p>
                        </li>
                        <li class="service-item">
                          <i class="fas fa-broom"></i>
                          <p class="text-service">
                            Dọn phòng hằng ngày
                          </p>
                        </li>
                        <li class="service-item">
                          <i class="far fa-snowflake"></i>
                          <p class="text-service">
                            Điều hòa
                          </p>
                        </li>
                        <li class="service-item">
                          <i class="fas fa-car"></i>
                          <p class="text-service">
                            Tủ lạnh nhỏ trong phòng
                          </p>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </section>
          </div>
          <div class="col-md-4 col-xs-12">
            <div class="room-sidebar">
              <div class="room-sidebar__content mb--18">
                <div class="room-sidebar__wrap">
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
                        v-model="checkin"
                        @change="quatity_day()"
                      >
                    </div>
                    <p>
                      đến
                    </p>
                    <div class="pick-time time-check-out">
                      <input type="date" class="form-control check-out"
                        v-model="checkout"
                        @change="quatity_day()"
                      >
                    </div>
                  </div>
                  <div class="input-group-person mt--6">
                    <div class="modal-booking-time el-popover__reference"
                      @click="show = !show"
                    >
                      <p class="cursor">{{ set_total_person() }} khách</p>
                    </div>
                    <div class="choose-person" v-if="show == true">
                      <div class="select-number">
                        <div class="select-number__title">
                          <p>Người lớn</p>
                        </div>
                        <div class="el-input-number">
                          <span class="el-input-number__decrease"
                            @click="minus_person_adult($event, old_person, room.capacity_adult_person)"
                            v-bind:class="over_flow_minus_adult(old_person, room.capacity_adult_person)"
                          >
                            <i class="fas fa-minus"></i>
                          </span>
                          <div class="el-input">
                            <input type="number" class="input-person"
                              min="1" :max="room.capacity_adult_person"
                              v-model="old_person"
                            >
                          </div>
                          <span class="el-input-number__increase"
                            @click="plus_person_adult($event, old_person, room.capacity_adult_person)"
                            v-bind:class="over_flow_plus(old_person, room.capacity_adult_person)"
                          >
                            <i class="fas fa-plus"></i>
                          </span>
                        </div>
                      </div>
                      <div class="select-number">
                        <div class="select-number__title">
                          <p>Trẻ em</p>
                        </div>
                        <div class="el-input-number">
                          <span class="el-input-number__decrease"
                            @click="minus_person_child($event, child_person, room.capacity_adult_person)"
                            v-bind:class="over_flow_minus_child(child_person, room.capacity_child_person)"
                          >
                            <i class="fas fa-minus"></i>
                          </span>
                          <div class="el-input">
                            <input type="number" class="input-person"
                              min="0" :max="room.capacity_child_person"
                              v-model="child_person"
                            >
                          </div>
                          <span class="el-input-number__increase"
                            @click="plus_person_child($event, child_person, room.capacity_child_person)"
                            v-bind:class="over_flow_plus(child_person, room.capacity_child_person)"
                          >
                            <i class="fas fa-plus"></i>
                          </span>
                        </div>
                      </div>
                      <div class="is-flex align-center jbetween mt--30"
                        @click="save_customers_when_use_choose_person()"
                      >
                        <div class="cursor bold c-primary">Áp dụng</div>
                      </div>
                    </div>
                  </div>
                  <div class="submit-booking-room">
                    <div class="needLogin" v-if="user_login">
                      <button
                        class="button button-b"
                        @click="order_page()"
                      >
                        Đặt ngay
                      </button>
                    </div>
                    <div class="needLogin" v-else>
                      <button
                        class="button button-b"
                        :disabled="true"
                      >
                        Login to booking room
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import StickyHeader from '../layouts/StickyHeader.vue'
  import {mapGetters} from 'vuex'
  import Slick from 'vue-slick';

  export default {
    data: function(){
      return {
        room: {},
        checkin: '',
        checkout: '',
        quatityday: 1,
        totalPrice: '',
        show: false,
        old_person: 1,
        child_person: 0,
      }
    },
    mounted(){
      let param = '/v1/rooms/' + this.$route.params.id
      this.$axios.get(param)
      .then(response => {
        this.room = response.data;
      })
      .catch(error => {
        console.log(error);
      });

      if (localStorage.check_in) {
        this.checkin = localStorage.check_in;
      }

      if (localStorage.check_out) {
        this.checkout = localStorage.check_out;
      }

      if (localStorage.old_person) {
        this.old_person = localStorage.old_person;
      }

      if (localStorage.child_person) {
        this.child_person = localStorage.child_person;
      }

      this.total_person()
      this.set_total_person()
    },
    methods: {
      quatity_day(){
        var a = new Date(this.checkin)
        var b = new Date(this.checkout)
        var difference = Math.abs(a - b);
        this.quatityday = difference/(1000 * 3600 * 24)
        localStorage.quatityday = this.quatityday
        localStorage.room_id = this.room.id
        localStorage.price = this.room.price
      },

      check_out(newValue){
        localStorage.check_out = this.checkout;
      },

      order_page(){
        this.$router.replace({
              name: 'BookingRoom',
              params: {
                id: this.$route.params.id
              },
          })
        localStorage.name_room = this.room.name
        localStorage.total_price = this.totalPrice
        this.save_customers()
      },

      plus_person_adult(event, person, quatity){
        if(person < quatity){
          this.old_person ++
        }
      },

      minus_person_adult(event, person, quatity){
        if(person > 1){
          this.old_person --
        }
      },

      plus_person_child(event, person, quatity){
        if(person < quatity){
          this.child_person ++
        }
      },

      minus_person_child(event, person, quatity){
        if(person > 0){
          this.child_person --
        }
      },

      over_flow_plus(person, quatity){
        return {
          "is-disabled": person == quatity
        }
      },

      over_flow_minus_child(person, quatity){
        return {
          "is-disabled": person == 0
        }
      },

      over_flow_minus_adult(person, quatity){
        return {
          "is-disabled": person == 1
        }
      },

      save_customers_when_use_choose_person() {
        this.save_customers()
        this.use_choose_person()
      },

      save_customers(){
        localStorage.old_person = this.old_person;
        localStorage.child_person = this.child_person;
      },

      use_choose_person(){
        this.show = !this.show
      },

      set_total_person() {
        if(isNaN(this.total_person())) {
          return 1
        }
        else {
          return this.total_person()
        }
      }
    },

    watch: {
      checkin(newValue) {
        localStorage.check_in = this.checkin;
      },

      checkout(newValue){
        localStorage.check_out = this.checkout;
      },
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
    components: {
      StickyHeader,
      Slick
    },
  }
</script>
<style lang="scss">
  .input-group-person {
    margin-top: 6px;
    margin-bottom: 1rem;
    .modal-booking-time  {
      height: 2.625rem;
      line-height: 2.625rem;
      padding: 0 0.8rem;
      border-radius: 5px;
      border: 1px solid #ebebeb;
    }
  }
</style>
