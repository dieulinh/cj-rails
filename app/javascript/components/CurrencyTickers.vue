<template>
  <div class="currency-page">
    <div class="capture-button">
      <button @click="capture()" class="btn">Capture</button>
    </div>
    <div class="coin-title currency-row">
      <div>Coin Name</div>
      <div>Bid</div>
      <div>Ask</div>
      <div>Last price</div>
      <div>Date time</div>
    </div>
    <div v-for="currency in currencies" :key="currency.id">
      <div class="currency-row history-link" :class="{ active: currency.currency_name==activeCoin }" @click="getHistories(currency.currency_name)">
        <div class="link">{{currency.currency_name}}</div>
        <div>{{currency.bid}}</div>
        <div>{{currency.ask}}</div>
        <div>{{currency.last}}</div>
        <div>{{currency.created_at | formatDate}}</div>
      </div>
      <div v-if="activeCoin==currency.currency_name" class="pd-20">
        <div class="currency-row history-title">History of {{currency.currency_name}}
          <div>Bid</div>
          <div>Ask</div>
          <div>Last price</div>
          <div>Date time</div>
        </div>
        <div class="currency-row" v-for="history in histories" :key="'history'+history.id">
          <div> # {{history.id}}</div>
          <div>{{history.bid}}</div>
          <div>{{history.ask}}</div>
          <div>{{history.last}}</div>
          <div>{{history.created_at | formatDate}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Vuex from 'vuex';
export default {
  data(){
    return {
      activeCoin: null
    };
  },
  methods: {
    capture() {
      this.$store.dispatch('capturePrices', 'ETHAUD-BTCAUD');
      this.activeCoin = null;
    },
    getHistories(coinName) {
      console.log(this.activeCoin);
      this.activeCoin = this.activeCoin!=coinName ? coinName : null;
      if (this.activeCoin)
      {
        this.$store.dispatch('getHistories', this.activeCoin);
      }
      
    }
  },
  computed: {
    histories() {
      return this.$store.state.histories;
    },
    capture_status() {
      return this.$store.state.capture_status;
    },
    currencies() {
      return this.$store.state.currencies;
    }
  },
  created(){
    console.log(this.$store);
  },
  mounted() {
    console.log('mounted products');
    this.$store.dispatch('getCurrencies', {});
  }
}
</script>
