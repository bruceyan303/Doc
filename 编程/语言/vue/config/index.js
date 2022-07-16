import { createApp } from 'vue'
import ArcoVue from '@arco-design/web-vue';
import App from './App.vue';
import '@arco-design/web-vue/dist/arco.css';

const app = createApp(App);
app.use(ArcoVue);
app.mount('#app');

const Main = {};
const app = Vue.createApp(Main);
app.use(window.ArcoVue);
app.use(window.ArcoVueIcon);
app.mount("#root");
