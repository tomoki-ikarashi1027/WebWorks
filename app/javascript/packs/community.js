import Vue from "vue/dist/vue.esm.js";
import Index from "./components/community-index.vue";

var app = new Vue({
  el: "#app",
  components: {
    contents: Index,
  },
});
