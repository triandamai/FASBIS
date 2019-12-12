<template>
  <v-app>
    <v-content>
      <v-dialog persistent v-model="dialogAlert" max-width="500px">
        <v-divider></v-divider>
        <v-card class="pa-5">
          <v-card-text>
            <h2>Anda gagal masuk</h2>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn large outlined color="purple darken-3" @click="reset">Tutup</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <v-container fluid fill-height>
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12">
              <v-toolbar dark color="purple darken-3">
                <v-btn text icon color="white">
                  <router-link to="/">
                    <v-icon>arrow_back</v-icon>
                  </router-link>
                </v-btn>
                <v-toolbar-title>Login form</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form ref="form" v-model="valid" :lazy-validation="lazy">
                  <v-text-field
                    prepend-icon="mail"
                    v-model="email"
                    :rules="emailRules"
                    label="E-mail"
                    suffix="@amikompurwokerto.ac.id"
                    required
                  ></v-text-field>
                  <v-text-field
                    prepend-icon="lock"
                    label="Password"
                    v-model="password"
                    :append-icon="show ? 'visibility' : 'visibility_off'"
                    :rules="[rules.required, rules.min]"
                    :type="show ? 'text' : 'password'"
                    @click:append="show = !show"
                  ></v-text-field>
                  <!-- <v-select
                    prepend-icon="person"
                    v-model="select"
                    :items="items"
                    item-text="name"
                    item-value="value"
                    :rules="[v => !!v || 'This is required']"
                    label="Masuk sebagai..."
                    @change="checkKategori"
                    required
                  ></v-select> -->
                </v-form>
              </v-card-text>
              <v-card-actions>
                <!-- <v-btn to="/register" large text color="primary">Belum punya akun?</v-btn> -->
                <v-spacer></v-spacer>
                <v-btn
                  large
                  color="white--text purple darken-3"
                  :disabled="!valid"
                  @click="login($event)"
                >Login</v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  name: "Home",
  data: () => ({
    show: false,
    valid: true,
    lazy: false,
    email: "",
    emailRules: [v => !!v || "E-mail is required"],
    password: "",
    rules: {
      required: value => !!value || "Required."
    },
    select: null,
    kategori: "",
    items: [
      { name: "Masuk sebagai prodi", value: "Prodi" },
      { name: "Masuk sebagai dosen", value: "Dosen" }
    ],
    dialogAlert: false
  }),
  created() {
    this.checkCurrentLogin();
  },
  methods: {
    checkKategori(value) {
      this.kategori = value;
    },
    checkCurrentLogin: function() {
      if (localStorage.getItem("isLogin")) {
        this.$router.replace(this.$route.query.redirect || "/dashboard");
        console.log("belum Login");
      }
    },
    login: function(event) {
      event.preventDefault();
      let data = {
        email: this.email + "@amikompurwokerto.ac.id",
        password: this.password,
        kategori: this.kategori
      };
      this.axios
        .post("/login", data)
        .then(result => {
          console.log(result.data);
          if (result.data.success) {
            localStorage.setItem("user", JSON.stringify(result.data.data));
            localStorage.setItem("isLogin", true);
            console.log(result.data.data[0].hak_akses);
            if (result.data.data[0].hak_akses == "aktif") {
              if (result.data.data[0].kategori === "Prodi") {
                this.$router.replace(
                  this.$route.query.redirect || "/dashboard"
                );
              } else if (result.data.data[0].kategori === "Dosen") {
                this.$router.replace(
                  this.$route.query.redirect || "/dashboard/list_surat"
                );
              }
            } else {
              this.$router.replace(
                this.$route.query.redirect || "/dashboard/no_access"
              );
            }
          } else {
            //Login gagal
            console.log("Gagal masuk");
            this.dialogAlert = true;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    reset() {
      this.$refs.form.reset();
      this.dialogAlert = false;
    }
  },
  metaInfo: {
    title: "Login | Prodi Teknik Informatika - Universitas Amikom Purwokerto",
    // override the parent template and just use the above title only
    titleTemplate: null
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/css/variables";

.v-application.theme--light {
  background-color: lighten(#c6d7db, 13) !important;
}

.application--wrap {
  min-height: 100vh !important;
}

.v-toolbar__title {
  font-family: $heading-font;
}

.v-btn__content a {
  color: #fff;
  text-decoration: none;
}
</style>