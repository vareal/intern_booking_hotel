<template>
  <div class="form-search">
    <div class="SearchBoxContainer">
      <div class="TabContent">
        <div class="GroupForm">
          <div class="ListSearchItem">
            <div class="Searchbox__wrapper">
              <div class="SearchBoxContainer">
                <div class="IconBox--autocomplete">
                  <div class="field">
                    <p class="control has-icons-left">
                      <input class="input fix-hight" type="text"
                        placeholder="Nhập điểm du lịch hoặc tên khách sạn"
                        v-model="name_room"
                      >
                      <span class="icon is-small is-left fix-hight">
                        <i class="fas fa-search"></i>
                      </span>
                    </p>
                  </div>
                </div>
                <div class="OptionalSearch">
                  <div class="IconBox--checkIn--checkOut">
                    <HotelDatePicker/>
                  </div>
                  <div class="IconBox--occupancy">
                    <div class="field">
                      <p class="control has-icons-left">
                        <input class="input fix-hight" type="number"
                          placeholder="Số lượng người">
                        <span class="icon is-small is-left fix-hight">
                          <i class="fas fa-user-friends"></i>
                        </span>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="OptionSearch">
          </div>
        </div>
      </div>
      <div class="TabContent__Search--button">
        <button class="button set-submit"
          @click="get_room(name_room)"
        >
          <div class="text-search">
            <span class="text-item">TÌM</span>
          </div>
        </button>
      </div>
    </div>
  </div>
</template>
<script>
  import HotelDatePicker from 'vue-hotel-datepicker'
  import 'vue-hotel-datepicker/dist/vueHotelDatepicker.css';
  import {mapMutations} from 'vuex'

  export default {
    components: {
      HotelDatePicker
    }
  }
</script>
