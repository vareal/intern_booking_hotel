<template>
  <div class="home-container">
    <section class="title-container-column">
      <SearchOption/>
      <SuggestHotel/>
    </section>
  </div>
</template>
<script>
  import SuggestHotel from './SuggestHotel.vue'
  import SearchOption from './search/SearchOption.vue'
  import Header from './Header.vue'

  export default {
    data: function(){
      return {
        user_login: false,
        current_user: {}
      }
    },
    components: {
      SearchOption,
      SuggestHotel,
    }
  }
</script>
