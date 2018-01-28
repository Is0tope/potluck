<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <div class="voucher_card">
          <img class="watson_logo small_logo" src="../assets/img/logo.png"/>
          <div class="right-text">VOUCHER</div>
          <hr class="divider"/>
          <img class="qrcode" src="../assets/img/qr-code.png"/>
          <br/>
          <hr class="divider"/>
          <p class="vtext"><b>SKU:</b> 1243433434</p>
          <p class="vtext"><b>Item:</b> {{product.description}}</p>
          <p class="vtext"><b>Discount:</b> 5% off</p>          
        </div>
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
      product: {}
    }
  },
  mounted: function(){
    this.product = Object.assign({}, this.product, store.product)
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
</style>
