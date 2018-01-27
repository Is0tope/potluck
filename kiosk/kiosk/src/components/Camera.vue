
<template>
  <video class="cameradiv" ref="video">
  </video>
</template>

<script>
import Instascan from 'instascan'

export default {
  name: 'Camera',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  mounted () {
      let scanner = new Instascan.Scanner({
          video: this.$refs.video,
          scanPeriod: 10
      })
      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
        }
      }).catch(function (e) {
        console.error(e);
      })
      scanner.addListener('scan', function (content) {
        console.log(content);
      });
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.cameradiv {
    width: 240px;
    height: 240px;
}
</style>
