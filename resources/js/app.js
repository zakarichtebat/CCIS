import './bootstrap';
import { createApp } from 'vue';
import Header from './components/Header.vue';

const app = createApp({});

app.component('app-header', Header);
app.mount('#app');
