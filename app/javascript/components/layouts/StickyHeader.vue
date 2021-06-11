<template lang="">
  <div class="SearchBoxContainer">
    <div class="Searchbox Searchbox--horizontal">
      <div class="Searchbox__wrapper">
        <HotelDatePicker />
        <div class="total-person">
          <div class="picker-person" @click="show_person">
            <p>
              <span>
                <span class="quantity">1</span>
                  Khách
              </span>
            </p>
          </div>
          <div class="choose-person" v-if="show == true">
            <div class="select-number">
              <div class="select-number__title">
                <p>Người lớn</p>
              </div>
              <input type="number" class="form-control input-person">
            </div>
            <div class="select-number">
              <div class="select-number__title">
                <p>Trẻ nhỏ</p>
              </div>
              <input type="number" class="form-control input-person">
            </div>
          </div>
        </div>
        <div class="submit-button">
          <button type="button" class="btn button-agoda">Cập nhập</button>
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
      show: false
    }
  },
  methods: {
    show_person(){
      this.show = !this.show
    }
  },
  components: {
    HotelDatePicker,
  }
}
</script>
