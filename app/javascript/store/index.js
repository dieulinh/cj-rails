import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);
const debug = process.env.NODE_ENV !== 'production';
const API_URL = process.env.ROOT_API;

const mutations = {
  histories(state, histories) {
    state.histories = histories;
  },
  capture(state, capture_status) {
    state.capture_status = capture_status;
  },
  currencies(state, currencies) {
    state.currencies = currencies
  },
  errors(state, error) {
    state.errors = error;
  }
};

const actions = {
  async getHistories({commit}, coinName) {
    try {
      let currencyHistoryUrl = `${process.env.ROOT_API}/currency_tickers/${coinName}`;
      
      let response = await axios.get(currencyHistoryUrl);
      console.log(response.data);
      commit("histories", response.data);
    } catch (exception) {
      console.error(exception);
    }
  },
  async getCurrencies({commit}, params) {
    try {
      let currencyListUrl = `${process.env.ROOT_API}/currency_tickers/`;
      if (params.currency_list) {
        currencyListUrl += `?currency_list=${params["currency_list"]}`;
      }
      let response = await axios.get(currencyListUrl);
      commit("currencies", response.data);
    } catch (exception) {
      console.error(exception);
    }
  },

  async capturePrices({commit}, coinList) {
    try {
      let response = await axios.post(`${process.env.ROOT_API}/currency_tickers?currency_list=${coinList}`);
      if (response.status == 201)
      {
        commit('currencies', response.data);
      } else {
        commit('errors', response.data);
      }
    } catch(error) {
      console.log(error);
      commit('errors', error);
    }
  },
 
};

const getters = {
  currencies: state => state.currencies,
  capture_status: state => state.capture_status
  
};

const state = {
  currencies: null,
  capture_status: null,
  histories: [],
  errors: null
};

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
});
