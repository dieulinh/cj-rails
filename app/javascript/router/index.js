import Vue from 'vue';
import VueRouter from 'vue-router';
  
import WelcomePage from '../components/Welcome.vue';

const routes = [
  {
    path: '/',
    component: WelcomePage
  },
  // otherwise redirect to home
  { path: '*', redirect: '/' }
];

export default new VueRouter({routes});