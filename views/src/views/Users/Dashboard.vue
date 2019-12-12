<template>
  <v-app id="inspire">
    <v-navigation-drawer v-model="drawer" app>
      <v-list-item two-line>
        <v-list-item-avatar>
          <img :src="'http://localhost/kp_amikom/uploads_dosen/'+currentUser.foto" alt="John" />
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title>{{ currentUser.nama }}</v-list-item-title>
          <v-list-item-subtitle>{{ currentUser.kategori }}</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item
          tag="router-link"
          v-for="(menu__link, index) in menu__links"
          :key="index"
          :to="menu__link.to"
          :href="menu__link.href"
        >
          <v-list-item-action>
            <v-icon>{{ menu__link.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>{{ menu__link.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="purple darken-3" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Dashboard</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn dark text @click="logout($event)">
        <v-icon dark left>exit_to_app</v-icon>Logout
      </v-btn>
    </v-app-bar>

    <v-content>
      <v-container grid-list-lg>
        <!-- router view -->
        <transition name="fade" mode="out-in">
          <router-view></router-view>
        </transition>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
const base__url = "/dashboard";
export default {
  data: () => ({
    menu: false,
    drawer: null,
    menu__links: [],
    currentUser: ""
  }),
  created() {
    this.checkCurrentLogin();
    this.getDataUser();
    this.checkKategori();
  },
  methods: {
    checkKategori() {
      let data = JSON.parse(localStorage.getItem("user"));
      let data__kategori = data[0].kategori;
      let hak_akses = data[0].hak_akses;

      if (hak_akses == "aktif") {
        if (data__kategori === "Prodi") {
          this.menu__links = [
            { to: base__url + "/home", title: "Home", icon: "dashboard" },
            {
              to: base__url + "/new_posts",
              title: "Buat artikel",
              icon: "add"
            },
            {
              to: base__url + "/list_posts",
              title: "Daftar artikel",
              icon: "insert_drive_file"
            },
            {
              to: base__url + "/list_users",
              title: "Daftar dosen",
              icon: "people"
            },
            {
              to: base__url + "/History",
              title: "History Surat",
              icon: "people"
            },
            {
              to: base__url + "/pengaturan",
              title: "Pengaturan hak akses",
              icon: "settings"
            },

            {
              to: "/",
              title: "Ke halaman utama",
              icon: "arrow_back"
            }
          ];
        } else if (data__kategori === "Dosen") {
          this.menu__links = [
            {
              to: base__url + "/list_surat",
              title: "Daftar surat",
              icon: "dashboard"
            },
            // {
            //   to: base__url + "/account",
            //   title: "Pengaturan akun",
            //   icon: "settings"
            // },
            {
              to: "/",
              title: "Ke halaman utama",
              icon: "arrow_back"
            },
            {
              to: base__url + "/History",
              title: "History Surat",
              icon: "people"
            }
          ];
        }
      } else {
        this.menu__links = [
          {
            to: "/",
            title: "Ke halaman utama",
            icon: "arrow_back"
          }
        ];
      }
    },
    checkCurrentLogin: function() {
      if (!localStorage.getItem("isLogin")) {
        this.$router.replace(this.$route.query.redirect || "/login");
      }
    },
    getDataUser: function() {
      let data = JSON.parse(localStorage.getItem("user"));

      this.axios
        .get("/user?id=" + data[0].id)
        .then(result => {
          this.currentUser = result.data.data[0];
        })
        .catch(err => {
          console.log(err);
        });

      this.checkKategori();
    },
    logout: function(event) {
      event.preventDefault();
      localStorage.token = false;
      this.checkCurrentLogin();
      localStorage.removeItem("user");
      localStorage.setItem("isLogin", false);
      this.$router.replace(this.$route.query.redirect || "/login");
    }
  },
  metaInfo: {
    title:
      "Dashboard | Prodi Teknik Informatika - Universitas Amikom Purwokerto",
    // override the parent template and just use the above title only
    titleTemplate: null
  }
};
</script>


<style lang="scss" scoped>
@import "../../assets/css/variables";

// override the stylinh
.v-application.theme--light {
  background-color: lighten(#c6d7db, 13) !important;
  font-family: $body-font !important;
}

.v-toolbar__title {
  font-family: $heading-font;
  font-weight: bold;
}
</style>

