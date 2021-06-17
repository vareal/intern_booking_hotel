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
                  <ValidateBooking v-bind:room="room"/>
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
  import ValidateBooking from './ValidateBooking.vue'

  export default {
    data: function(){
      return {
        room: {},
        slickOptions: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true
        }
      }
    },

    beforeUpdate() {
      if (this.$refs.slick) {
        this.$refs.slick.destroy();
      }
    },

    updated() {
      this.$nextTick(function () {
        if (this.$refs.slick) {
            this.$refs.slick.create(this.slickOptions);
        }
      });
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
    },

    components: {
      StickyHeader,
      Slick,
      ValidateBooking
    },
  }
</script>
