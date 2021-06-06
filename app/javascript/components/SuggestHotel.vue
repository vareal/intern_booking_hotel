<template>
  <div>
    <div class="container featured-properties">
      <div class="tilte-suggest">
        <h3>Featured homes recommended for you</h3>
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
        <div class="list-room">
          <div
            class="room-item"
            v-for="(room, index) in rooms"
            :key= "index"
          >
            {{room.name}}
          </div>
        </div>
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
      }
    },

    computed: {
      select_form_search() {
        let index = this.sellected
        return this.cities[index]
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
