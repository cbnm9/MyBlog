<template>
  <navbar position="fixed" type="primary" menu-classes="ml-auto">
    <template>
      <router-link v-popover:popover1 class="navbar-brand" to="/">Minseong's Portfolio</router-link>
    </template>
    <template slot="navbar-menu">
      <li class="nav-item">
        <router-link class="nav-link" to="/profile">
          <i class="now-ui-icons users_circle-08"></i>
          <p>Profile</p>
        </router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" to="/">
          <i class="now-ui-icons files_single-copy-04"></i>
          <p>blog</p>
        </router-link>
      </li>
    </template>
  </navbar>
</template>

<script>
import { Navbar } from "@/components";
import { Popover } from "element-ui";

export default {
  name: "main-navbar",
  components: {
    Navbar,
    [Popover.name]: Popover,
  },
};
</script>

<style scoped></style>
