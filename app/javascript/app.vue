<template>
  <div id="app">
    <div class="layout-wraper" v-if="showLayout">
      <Header/>
    </div>
    <router-view/>
  </div>
</template>
<script>
  import Header from "./components/Header"

  export default {
    components: {
      Header
    },

    computed: {
      showLayout(){
        return this.$store.state.showLayout
      }
    },
  }
</script>
