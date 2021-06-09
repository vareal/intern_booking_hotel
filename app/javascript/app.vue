<template>
  <div id="app">
    <Header
      v-bind:user_login="user_login"
      v-bind:current_user="current_user"
    />
    <router-view/>
  </div>
</template>
<script>
  import Header from "./components/Header"

  export default {
    data: function(){
      return {
        user_login: false,
        current_user: {}
      }
    },
    components: {
      Header
    },
    mounted(){
      this.$axios.get('/v1/user_login')
      .then(response => {
        this.user_login = response.data;
      })
      .catch(error => {
        console.log(error);
      });

      this.$axios.get('/v1/current_user')
      .then(response => {
        this.current_user = response.data;
      })
      .catch(error => {
        console.log(error);
      });
    },
  }
</script>
