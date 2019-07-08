import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
Vue.config.productionTip = false;
//@ts-ignore
import VueGoodTablePlugin from 'vue-good-table'

import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue)

Vue.use(VueGoodTablePlugin)

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
