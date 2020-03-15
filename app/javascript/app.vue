<template>
  <div>
    <router-view />
  </div>
</template>

<script>
import CurrencyTickersComponent from './components/CurrencyTickers';
export default {
  components : { CurrencyTickersComponent },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
