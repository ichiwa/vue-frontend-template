import 'url-search-params-polyfill';
import _ from 'lodash';
import Vue from 'vue';
import App from './components/App.vue';
import router from './router';
import store from './store';
import filters from './filter';
import './assets/css/global.scss';

if (process.env.NODE_ENV === 'production') {
  Vue.config.silent = true;
  Vue.config.devtools = false;
  Vue.config.performance = false;
  Vue.config.productionTip = false;
} else {
  Vue.config.silent = false;
  Vue.config.devtools = true;
  Vue.config.performance = true;
  Vue.config.productionTip = true;
}

_.map(filters, (value, key) => {
  Vue.filter(key, value);
});

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
