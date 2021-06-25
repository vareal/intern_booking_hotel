<template>
  <div id="searchPageVueRoot">
    <div id="vueSearchPage" class="SearchPage">
      <div class="TopBarContainer">
        <div id="topbar" class="topbar-wrapper show-search">
          <StickyHeader/>
          <div id="FilterBar" class="Filter hidePopularFilter">
            <div class="Filter__Container">
              <span class="Filter__Label"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="container-vue SearchPage--smallscreen">
        <div class="main-column">
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-9">
              <div class="contentContainer">
                <div class="sort-bar">
                  <div class="SortBar__Header">
                    <span class="HeaderSort">Sắp xếp</span>
                  </div>
                  <div v-for="(search, id) in search_options" :key="id"
                    class="SortBar__Item"
                    @click="select_option($event, search.id)"
                    v-bind:class="active_option(search.id)"
                  >
                    <a>
                      <span v-html="search.name"></span>
                    </a>
                  </div>
                </div>
                <div v-if="rooms.length > 0">
                  <ol class="hotel-list-container">
                    <li class="PropertyCard PropertyCardItem"
                      v-for="(room, id) in rooms" :key="id"
                    >
                      <div class="JacketContent JacketContent--Empty">
                        <router-link :to="{name: 'RoomDetail',
                          params: { id: room._id }}">
                          <div class="row PropertyCard__Container">
                            <div class="col-md-4">
                              <div class="Gallery">
                                <img src="./room.png">
                              </div>
                            </div>
                            <div class="col-md-4 sort">
                              <div class="sort-content">
                                <aside class="List PropertyCard__TopBadges">
                                  <ul class="List__List List__List--Horizontal">
                                    <li>
                                      <div class="TooltipWrapper">
                                        <span class="badge bg-check">
                                          <i class="fas fa-check"></i>
                                          Agoda Huỷ Dễ Dàng
                                        </span>
                                      </div>
                                    </li>
                                    <li>
                                      <div class="TooltipWrapper">
                                        <span class="badge bg-up">
                                          <i class="fas fa-angle-double-up"></i>
                                          Nhiều người quan tâm
                                        </span>
                                      </div>
                                    </li>
                                  </ul>
                                </aside>
                                <header class="room-infor">
                                  <h3 class="hotel-name">
                                    {{ room._source.name }}
                                  </h3>
                                  <div class="address">
                                    <span class="Address__Container">
                                      <i class="fas fa-map-marker-alt"></i>
                                      <span class="city-name">
                                        Thanh Xuân, Hà Nội
                                      </span>
                                    </span>
                                  </div>
                                </header>
                              </div>
                            </div>
                            <div class="col-md-4">
                              <div class="price-infor">
                                <aside class="List PropertyCard__Prices">
                                  <ul class="List__List List__List--Vertical">
                                    <li class="final-price">
                                      <span>
                                        {{ room._source.price  | format_price }}
                                      </span>
                                    </li>
                                  </ul>
                                </aside>
                                <div class="PropertyCard__PricingBottomMessages">
                                  <div class="room-benefit">
                                    <span>Hủy miễn phí!</span>
                                  </div>
                                </div>
                                <div class="see-detail">
                                  <button class="button see-room">
                                    <span>Xem phòng trống</span>
                                    <i class="fas fa-arrow-right"></i>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </router-link>
                      </div>
                    </li>
                  </ol>
                </div>
                <div v-else>
                  <div class="search-panel">
                    <h1>
                      Không tìm thấy kết quả của
                      <strong>{{ no_find }}</strong>
                    </h1>
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

  export default {
    data: function(){
      return {
        choose_search: 1,
        search_options:[
          {
            id: 1,
            name: 'Phù hợp nhất'
          },
          {
            id: 2,
            name: 'Giá thấp nhất trước'
          },
          {
            id: 3,
            name: 'Khoảng Cách <i class="fas fa-angle-down"></i>'
          },
          {
            id: 4,
            name: 'Được Đánh Giá Hàng Đầu <i class="fas fa-angle-down"></i>'
          },
          {
            id: 5,
            name: 'Mách bạn ưu đãi'
          }
        ]
      }
    },

    methods: {
      select_option(event, index) {
          this.choose_search = index
        },

      active_option(index) {
        return {
          active: this.choose_search === index
        }
      },
    },

    mounted() {
      this.$store.dispatch('get_Room', this.$route.params.name)
    },

    computed: {
      selected_option() {
        let index = this.choose_search
        return this.search_options[index]
      },

      no_find() {
        return this.$store.state.getroom.name_room
      },

      ...mapGetters(['rooms'])
    },

    components: {
      StickyHeader
    },
  }
</script>
