<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <transition name="fade">
          <div v-show="show" class="voucher_card">
            <img class="watson_logo small_logo" src="../assets/img/logo.png"/>
            <div class="right-text">VOUCHER</div>
            <hr class="divider"/>
            <img class="qrcode" src="../assets/img/qr-code.png"/>
            <br/>
            <hr class="divider"/>
            <p class="vtext"><b>SKU:</b> {{product.product_id}}</p>
            <p class="vtext"><b>Item:</b> {{product.description}}</p>
            <p class="vtext"><b>Discount:</b> 5% off</p>          
          </div>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>

import store from '../store'

export default {
  name: 'Voucher',
  data: function(){
    return {
      product: {},
      show: false
    }
  },
  mounted: function(){
    console.log('mounted')
    this.product = Object.assign({}, this.product, store.product)
    setTimeout(this.showvoucher,1000)
    console.log('wow')
  },
  methods: {
    showvoucher: function(){
      console.log('show')
      this.show = true
    }
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .voucher_card {
    height: 600px;
    background: white;
    width: 100%;
    padding: 10px;
    padding-top: 45px;
    color:#777;
    -webkit-box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.75);
    -moz-box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.75);
    box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.75);
  }
  .small_logo {
    width: 60px;
    left: 20px;
  }
  .right-text {
    position: absolute;
    right: 20px;
    top: 10px;
    font-size: 20pt;
  }
  .qrcode {
    width: 60%;
  }
  .divider {
    border-top: 2px dotted #777;
  }
  .vtext {
    font-size: 16pt;
  }
  .fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
    opacity: 0;
  }
</style>
