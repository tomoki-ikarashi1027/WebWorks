import Vue from "vue/dist/vue.esm.js";
import VueRouter from "vue-router";
import Index from "../components/memo-index.vue";
import About from "../components/task_about.vue";

Vue.use(VueRouter);

export default new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Index },
    { path: "/task_about", component: About },
  ],
});
