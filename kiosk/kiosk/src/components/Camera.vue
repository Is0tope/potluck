
<template>
<div>
  <video v-show="!scanned" class="cameradiv" ref="video">
  </video>
  <div v-show="scanned" class="member">
    <p><b>Found Member: </b>{{number}}</p>
  </div>
</div>
</template>

<script>
import Instascan from 'instascan'
import bus from '../bus'
import router from '../router'

export default {
  name: 'Camera',
  data () {
    return {
      number: null,
      scanned: false
    }
  },
  mounted () {
     let that = this
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
        that.number = content
        that.scanned = true
        setTimeout(function(){
          router.push('game')
        },1000)
      });
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.cameradiv {
    width: 600px;
    margin-top: 20px;
}
.member {
  padding-top: 100px;
  font-size: 40pt;
}
</style>
