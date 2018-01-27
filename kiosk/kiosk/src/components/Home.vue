<template>
  <div class="container scandiv">
    <div class="row">
      <div class="barcode crop">
        <Camera/>
      </div>	
    </div>	
    
    <div class="row scancode text-center">
      
      <p>Scan Your Code</p>

    </div>
  </div>
</template>

<script>
import Camera from './Camera.vue'

export default {
  name: 'Home',
  components: {Camera}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .crop {
    background-image:url("../assets/img/scan_bracket.png");
  }
</style>
