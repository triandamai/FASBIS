import Vue from "vue";
import "./plugins/vuetify";
import App from "./App.vue";
import axios from "axios";
import vuetify from "./plugins/vuetify";
import VueAxios from "vue-axios";
import VueMeta from "vue-meta";
import router from "./router";
import VueDisqus from "vue-disqus";
import { library } from "@fortawesome/fontawesome-svg-core";
import {
	faBook,
	faGlobe,
	faLock,
	faCheckCircle,
	faEnvelope
} from "@fortawesome/free-solid-svg-icons";
import {
	faInstagram,
	faTwitter,
	faFacebook
} from "@fortawesome/free-brands-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import "flickity/dist/flickity.css";
import infiniteScroll from "vue-infinite-scroll";

library.add(
	faCheckCircle,
	faLock,
	faGlobe,
	faBook,
	faInstagram,
	faTwitter,
	faFacebook,
	faEnvelope
);

Vue.component("font-awesome-icon", FontAwesomeIcon);
Vue.use(VueAxios, axios);
Vue.use(VueMeta);
Vue.use(VueDisqus);
Vue.use(infiniteScroll);

axios.defaults.baseURL = "http://localhost/kp_amikom/index.php/api";
Vue.config.productionTip = false;

new Vue({
	router,
	vuetify,
	render: h => h(App)
}).$mount("#app");
