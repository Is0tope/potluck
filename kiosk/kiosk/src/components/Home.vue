<template>
  <div class="container scandiv">
    <div class="row">
      <div class="barcode crop">
        <Camera/>
      </div>	
    </div>	
    
    <div v-show="!scanned" class="text-center offset">
      <p style="text-align:center;"><img src="../assets/img/card.png" class="cardimg"/></p>

      <p class="scan-text">Please scan your MoneyBack card...</p>
    </div>
    <div v-show="scanned" class="text-center offset">
      <p class="scan-text"><b>Found Member:</b> {{number}}</p>
    </div>
  </div>
</template>

<script>
import Camera from './Camera.vue'
import bus from '../bus'
import router from '../router'
import store from '../store'


var app = {
  name: 'Home',
  components: {Camera},
  data: function() {
    return {
      number : null,
      scanned: false
    }
  }
}

bus.$on('scanned',function(x){
  console.log('home got event')
  store.number = x
})

export default app
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .crop {
    background-image:url("../assets/img/scan_bracket.png");
    background-repeat: initial;
    background-size: 100% 100%;
  }
  .barcode{
    margin: auto;
    background-color: rgba(75, 75, 75, 0.3);
    /*
    background: -webkit-linear-gradient(to bottom, rgba(0, 121, 145, 0.5), rgba(10, 181, 176, 0.5));  /* Chrome 10-25, Safari 5.1-6 */
    /*background: linear-gradient(to bottom, rgba(0, 121, 145, 0.3), rgba(10, 181, 176, 0.3)); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        width: 640px;
    height: 415px;
      border-radius: 8px;
    
  }
  .scan-text {
    font-size: 28pt;
  }

  .offset {
    margin-top: 20px;
  }

  .cardimg {
    opacity: 0.7;
    width: 100px;
  }
</style>
