<template lang="">
  <div class="SearchBoxContainer">
    <div class="Searchbox Searchbox--horizontal">
      <div class="Searchbox__wrapper">
        <div class="IconBox--autocomplete">
          <div class="IconBox__wrapper">
            <i class="fas fa-search"></i>
            <div class="IconBox__child">
              <input placeholder="Nhập điểm du lịch hoặc tên khách sạn"
                v-model="name_room"
              >
            </div>
          </div>
        </div>
        <HotelDatePicker/>
        <div class="total-person">
          <div class="picker-person" @click="show_person">
            <p>
              <span>
                <span class="quantity">
                  {{ total_person }}
                </span>
                  Khách
              </span>
            </p>
          </div>
          <div class="choose-person" v-if="show == true">
            <div class="select-number">
              <div class="select-number__title">
                <p>Người lớn</p>
              </div>
              <div class="el-input-number">
                <span class="el-input-number__decrease"
                  @click="minus_person_adult($event, adult, room.capacity_adult_person)"
                  v-bind:class="over_flow_minus_adult(adult, room.capacity_adult_person)"
                >
                  <i class="fas fa-minus"></i>
                </span>
                <div class="el-input">
                  <input type="number" class="input-person"
                    min="1" :max="room.capacity_adult_person"
                    v-model="adult"
                  >
                </div>
                <span class="el-input-number__increase"
                  @click="plus_person_adult($event, adult, room.capacity_adult_person)"
                  v-bind:class="over_flow_plus(adult, room.capacity_adult_person)"
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
                  @click="minus_person_child($event, child, room.capacity_adult_person)"
                  v-bind:class="over_flow_minus_child(child, room.capacity_child_person)"
                >
                  <i class="fas fa-minus"></i>
                </span>
                <div class="el-input">
                  <input type="number" class="input-person"
                    min="0" :max="room.capacity_child_person"
                    v-model="child"
                  >
                </div>
                <span class="el-input-number__increase"
                  @click="plus_person_child($event, child, room.capacity_child_person)"
                  v-bind:class="over_flow_plus(child, room.capacity_child_person)"
                >
                  <i class="fas fa-plus"></i>
                </span>
              </div>
            </div>
          </div>
        </div>
        <div class="submit-button">
          <button type="button" class="btn button-agoda"
            @click="get_room(name_room)"
          >
            TÌM
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import HotelDatePicker from 'vue-hotel-datepicker'
  import 'vue-hotel-datepicker/dist/vueHotelDatepicker.css';

  export default {
    data: function(){
      return {
        show: false,
        adult: 1,
        child: 0,
        name_room: this.$route.query.name,
      }
    },
    methods: {
      show_person(){
        this.show = !this.show
      },

      status_person(){

      },

      plus_person_adult(event, person, quatity){
        if(person < quatity){
          this.adult ++
        }
      },

      minus_person_adult(event, person, quatity){
        if(person > 1){
          this.adult --
        }
      },

      plus_person_child(event, person, quatity){
        if(person < quatity){
          this.child ++
        }
      },

      minus_person_child(event, person, quatity){
        if(person > 0){
          this.child --
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
    },

    computed: {
      total_person(){
        return this.adult + this.child
      },
    },

    components: {
      HotelDatePicker,
    }
  }
</script>
