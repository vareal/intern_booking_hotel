<template>
  <div class="home-container">
    <section class="title-container-column">
      <SearchOption/>
      <ListCity/>
      <SuggestHotel/>
    </section>
  </div>
</template>
<script>
  import SuggestHotel from './SuggestHotel.vue'
  import SearchOption from './search/SearchOption.vue'
  import ListCity from './layouts/ListCity.vue'

  export default {
    components: {
      SearchOption,
      SuggestHotel,
      ListCity
    },
  }
</script>
