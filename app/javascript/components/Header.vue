<template lang="">
  <div class="header-page">
    <div class="container is-fullhd">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a href="/">
            <img src="../assets/images/logo.png" v-bind:alt="logo.alt">
          </a>
        </div>
        <div id="navbarBasicExample" class="navbar-menu">
          <div class="navbar-start">
            <a class="navbar-item"
              v-for="(item, index) in list_menu" :key="index"
            >
              <span v-html="item.content"></span>
            </a>
          </div>
          <div class="navbar-end">
            <div class="navbar-item">
              <div class="buttons">
                <div class="group-right sign-wraper">
                  <a class="button rent-room font-size-button">
                    <span>Đăng ký cho thuê nhà</span>
                  </a>
                  <template v-if="user_login == false">
                    <a class="button login font-size-button" href="/users/sign_in">
                      <span>Đăng nhập</span>
                    </a>
                    <a class="button sign-up font-size-button" href="/users/sign_up">
                      <span> Tạo tài khoản </span>
                    </a>
                  </template>
                </div>
                <div
                  v-if="user_login == true"
                  class="group-right dropdown is-right"
                  @click="click_show()"
                  v-bind:class="active_dropdown()"
                >
                  <div class="dropdown-trigger">
                    <div class="button money"
                      aria-haspopup="true"
                      aria-controls="dropdown-menu6"
                    >
                      <span>
                        <i class="fas agoda fa-money-check-alt" style="color: #704dff;">
                        </i>
                      </span>
                      <span class="icon is-small">
                        <i class="fas fa-angle-down" style="color: black;"
                          aria-hidden="true"></i>
                      </span>
                    </div>
                  </div>
                  <div class="custom-dropdown dropdown-menu" id="dropdown-menu3" role="menu">
                    <div class="container dropdown-content">
                      <div class="title-dropdown">
                        Tài khoản của tôi
                      </div>
                      <div class="list-content">
                        <a href="#" class="dropdown-item">
                          Đặt chỗ của tôi
                        </a>
                        <a href="#" class="dropdown-item">
                          Hộp thư
                        </a>
                        <a href="#" class="dropdown-item">
                          Tiền Agoda
                        </a>
                        <a href="#" class="dropdown-item">
                          Nhận xét
                        </a>
                        <a href="#" class="dropdown-item">
                          Hồ sơ của tôi
                        </a>
                        <hr class="dropdown-divider">
                        <a href="/users/sign_out" data-method="delete" class="button btn btn-ground">
                          Thoát
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    user_login: Boolean,
    current_user: Object
  },
  data: function(){
    return {
      show: false,
      logo: {
        alt: 'logo'
      },
      list_menu: [
        {
          content: 'Máy bay + K.sạn'
        },
        {
          content: 'Chỗ ở'
        },
        {
          content: 'Chuyến bay'
        },
        {
          content: 'Ưu đãi hôm nay'
        },
        {
          content: '<i class="fas fa-hotel"></i>Căn hộ'
        },
      ],
    }
  },
  methods: {
    active_dropdown(){
      return {
        "is-active": this.show == true
      }
    },
    click_show(){
      this.show = !this.show
    }
  }
}
</script>
