<template lang="">
  <div class="mmb-page mmb-giftcards-page">
    <div class="giftcards-title">
      <i class="fas fa-money-check-alt"></i>
      <span class="titleText title-separator">Tiền Agoda</span>
      <span class="titleTagLine">Kiếm nhanh. Đổi dễ. Ung dung tiết kiệm.</span>
    </div>
    <div class="giftcards-content">
      <div class="giftcard-summary-image-container">
        <img class="giftcard-summary-image" src="./gift.png">
      </div>
      <div class="giftcard-info">
        <ul class="list-table">
          <li>
            <span>Tổng số dư hiện tại:</span>
            <span class="giftcard-balance-value">
              {{ coins | format_price }}
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'

  export default {
    data() {
      return {
        money: ''
      }
    },

    mounted(){
      this.$store.dispatch('get_Coins')
    },

    filters: {
      format_price: function(price){
        return price.toLocaleString('it-IT',
                                    {style : 'currency',
                                    currency : 'VND'});
      }
    },

    computed: {
      ...mapGetters(['coins']),
    }
  }
</script>
<style lang="scss">
  .mmb-giftcards-page {
    .fa-money-check-alt {
      font-size: 36px;
      color: #704dff;
      margin: 0 6px;
    }

    .titleText {
      font-size: 26px;
      color: #2a2a2e;
    }

    .title-separator:after {
      height: 26px;
      content: " ";
      position: absolute;
      z-index: 1;
      border-right: 2px solid #bec2c9;
      margin: 8px 0 0 13px;
    }

    .titleTagLine {
      font-size: 22px;
      font-weight: 300;
      color: #2a2a2e;
      margin-left: 26px;
      line-height: 37px;
    }

    .giftcards-content {
      margin-top: 8px;
      border: 1px solid #eee;
      background-color: #fff;
      box-shadow: 0 0 10px 0 rgb(212, 212, 212);
      display: inline-block;
      width: 100%;
      .giftcard-summary-image-container {
        float: left;
        position: relative;
        display: block;
        background-color: #fff;
        padding: 12px 11px 30px;
        margin-right: 15px;
        height: 100%;
        min-height: 232px;
        width: 300px;
        .giftcard-summary-image {
          border: 1px solid #ddd;
          border-radius: 10px;
          width: 300px;
          height: 190px;
        }
      }
    }

    .giftcard-info {
      overflow: hidden;
      font-size: 15px;
      .list-table {
        width: 100%;
        display: table;
        border-collapse: collapse;
        li {
          border: none;
          font-weight: 700;
          margin: 0;
          list-style: none;
          display: table-cell;
          height: 50px;
        }
      }
    }
  }
</style>
