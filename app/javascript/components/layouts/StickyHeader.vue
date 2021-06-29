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
                  1
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
                >
                  <i class="fas fa-minus"></i>
                </span>
                <div class="el-input">
                  <input type="number" class="input-person"
                    min="1"
                  >
                </div>
                <span class="el-input-number__increase"
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
                >
                  <i class="fas fa-minus"></i>
                </span>
                <div class="el-input">
                  <input type="number" class="input-person"
                    min="0"
                  >
                </div>
                <span class="el-input-number__increase"
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
    },

    components: {
      HotelDatePicker,
    }
  }
</script>
