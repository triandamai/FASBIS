<template>
  <v-app id="inspire">
    <v-content>
      <v-container
        fluid
        fill-height
      >
        <v-layout
          align-center
          justify-center
        >
          <v-flex
            xs12
            sm8
            md4
          >
            <v-card class="elevation-12">
              <v-toolbar
                dark color="purple darken-3"
              >
               <v-btn text icon color="white">
                  <router-link to="/">
                    <v-icon>arrow_back</v-icon>
                  </router-link>
                </v-btn>
                <v-toolbar-title>Register form</v-toolbar-title>
                <v-spacer></v-spacer>
              </v-toolbar>
              <v-card-text>
                <v-form>
                <v-text-field
                    label="Nama lengkap"
                    v-model="nama"
                    prepend-icon="person"
                    type="text"
                  ></v-text-field>

                  <v-text-field
                    label="NIDN"
                    v-model="nidn"
                    prepend-icon="vpn_key"
                    type="text"
                    :rules="[v => !!v || 'NIDN is required']"
                  ></v-text-field>
                
                  <v-text-field
                    label="E-mail"
                    v-model="email"
                    :rules="emailRules"
                    prepend-icon="email"
                    type="text"
                  ></v-text-field>

                  <v-text-field
                    id="password"
                    label="Password"
                    v-model="password"
                    prepend-icon="lock"
                    :append-icon="show ? 'visibility' : 'visibility_off'"
                    :rules="[rules.required, rules.min]"
                    :type="show ? 'text' : 'password'"
                    @click:append="show = !show"
                  ></v-text-field>

                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-btn to="/login" large text color="primary">Sudah punya akun?</v-btn>
                <v-spacer></v-spacer>
                <v-btn dark large color="purple darken-3" @click="register($event)">Sign up</v-btn>
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
    data: () => ({
      show: false,
      valid: true,
      nama:'',
      nidn:'',
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid'
      ],
      password: '',
      rules: {
        required: value => !!value || 'Required.'
      },
      kategori:'Dosen'
    }),
    methods: {
        register(event) {
            let data = {
              nama: this.nama,
              email : this.email,
              password : this.password,
              nidn: this.nidn,
              kategori: this.kategori
            }
            this.axios.post('/user', data)
            .then(result => {
                console.log(result.data); // coba test ada apa enggak 
                if(result.data.success){
                    localStorage.setItem('user', JSON.stringify(result.data.data));
                    localStorage.setItem('isLogin',true);
                    this.$router.replace(this.$route.query.redirect || '/dashboard/list_surat');  
                } else{
                //Login gagal
                console.log("Gagal daftar");
                }
            }).catch((err) => {
                console.log(err);
            });
        }
    },
    metaInfo: {
        title: "Register | Prodi Teknik Informatika - Universitas Amikom Purwokerto",
        // override the parent template and just use the above title only
        titleTemplate: null
    }
}
</script>

<style lang="scss" scoped>
@import "../assets/css/variables";

.v-application.theme--light {
  background-color:lighten(#C6D7DB, 13)!important;
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

