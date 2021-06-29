<template lang="">
  <div class="TopDestinationRail">
    <span class="title-content">Các điểm đến thu hút nhất Việt Nam</span>
    <div>
      <slick class="list-cites" ref="slick" :options="slickOptions">
        <div class="city-item" v-for="(city, index) in cities" :key="index"
        >
          <router-link @click.native="getRoomCity(city.id)" :to="{name: 'ListRoomCity' , params: {name: city.name }}"
            class="url-detail"
          >
            <img src="./city.jpeg" class="TopDestinationItem__Image">
            <span class="TopDestinationItem__City">{{ city.name }}</span>
            <span class="CounterRoom">9,936 chỗ ở</span>
          </router-link>
        </div>
      </slick>
    </div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  import Slick from 'vue-slick';

  export default {
    data() {
      return {
        slickOptions: {
          centerMode: true,
          centerPadding: '30px',
          slidesToShow: 6,
          slidesToScroll: 3,
          infinite: true,
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

    methods: {
      getRoomCity(data) {
        this.$store.dispatch('getRoomFromCity', data)
      }
    },

    computed: {
      ...mapGetters(['cities'])
    },

    mounted(){
      this.$store.dispatch('get_listCities')
    },

    components: {
      Slick
    }
  }
</script>
