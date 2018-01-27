<template>
  <div id="app">
    <nav class="navbar navbar-scancode text-center">
      <h2>Potluck</h2>
      <img class="watson_logo" src="./assets/img/logo.png">
    </nav>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
.watson_logo {
  position: absolute;
  left: 10px;
  top: 5px;
}
</style>
