<template>
  <div>
    <div class="container featured-properties">
      <div class="tilte-suggest">
        <h3 class="title-content">Những chỗ nghỉ nổi bật khuyến nghị cho bạn:</h3>
      </div>
      <ul class="city-famous">
        <li
          class="city_item"
          v-for="(city, index) in cities"
          :key="index"
          @click="testFunc($event, index, city.id)"
          v-bind:class="active_city(index)"
          :data-id="city.id"
        >
          <div class="size-padding">
            <span>{{ city.name }}</span>
          </div>
        </li>
      </ul>
      <div class="wrapper-room">
        <div class="list-room row">
          <div
            class="room-item col-md-3"
            v-for="(room, index) in rooms"
            :key= "index"
          >
            <router-link :to="{ name: 'RoomDetail', params: { id: room.id }}"
              class="link_to_room"
            >
              <div class="room-item-wraper">
                <div class="image-room">
                  <img src="../assets/images/roomimage.jpeg">
                </div>
                <div class="nameRoom">
                  <span class="contentName">
                    {{room.name}}
                  </span>
                </div>
                <div class="city-room">
                  <div class="city-infr">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>{{ name_current_city }}</span>
                  </div>
                </div>
                <div class="price-infor">
                  <span class="content-infr">Tổng giá mỗi đêm</span>
                </div>
                <div class="final-price">
                  <span>{{ room.price | format_price }}</span>
                </div>
              </div>
            </router-link>
          </div>
        </div>
      </div>
      <div class="read-more-city">
        <button class="button primary-button">
          <div class="nameCity">
            <span>Xem thêm các chỗ nghỉ ({{ name_current_city }})</span>
          </div>
        </button>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data: function(){
      return {
        cities: [],
        rooms: [],
        sellected: 0
      }
    },

    methods: {
      testFunc(event, index, id){
        this.select_city(event, index)
        this.ajax_getRoom_Fromcity(id)
      },
      select_city(event, index) {
        this.sellected = index
      },
      active_city(index) {
        return {
          active: this.sellected === index
        }
      },
      ajax_getRoom_Fromcity(id) {
        this.$axios.get('/v1/get_room_form_city',{
                          params: {
                            city_id: id
                          }
                        })
        .then(response => {
          this.rooms = response.data;
        })
        .catch(error => {
          console.log(error);
        });
      },
    },

    computed: {
      select_form_search() {
        let index = this.sellected
        return this.cities[index]
      },

      name_current_city() {
        return this.select_form_search ? this.select_form_search.name : ''
      }
    },

    mounted(){
      this.$axios.get('/v1/user_page')
      .then(response => {
        this.cities = response.data;
      })
      .catch(error => {
        console.log(error);
      });

      this.$axios.get('/v1/get_room_form_city')
      .then(response => {
        this.rooms = response.data;
      })
      .catch(error => {
        console.log(error);
      });
    }
  }
</script>
<style lang="scss">
  .room-item-wraper {
    box-sizing: border-box;
    flex-wrap: wrap;
    margin: -2px;
    width: calc(100% + 4px);
    text-align: left;
    .price-infor {
      .content-infr {
        font-size: 12px;
        line-height: 16px;
        font-weight: 400;
        color: rgb(115, 115, 115);
      }
    }

    .final-price {
      span {
        font-size: 16px;
        line-height: 22px;
        font-weight: 500;
        color: rgb(225, 45, 45);
      }
    }
  }
</style>
