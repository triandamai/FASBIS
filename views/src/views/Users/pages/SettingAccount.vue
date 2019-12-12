<template>
  <div>
    <v-dialog v-model="dialog" max-width="450">
      <v-card class="pa-5">
        <v-card-text>
          <h2
            style="line-height:1.5"
          >Password yang Anda masukkan tidak sama dengan yang ada di database kami</h2>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn large color="primary" text @click="dialog = false">Oke</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-container>
      <h2 class="mb-3">Pengaturan akun</h2>
      <v-layout row wrap>
        <v-flex sm8>
          <v-card class="pa-5">
            <v-form class="pa-5" ref="form" v-model="valid">
              <v-text-field outlined v-model="nama" label="Nama"></v-text-field>
              <v-text-field outlined v-model="nidn" label="NIDN"></v-text-field>
              <v-text-field outlined v-model="email" label="Email"></v-text-field>
              <v-text-field
                outlined
                v-model="old_password"
                :append-icon="show1 ? 'visibility' : 'visibility_off'"
                :rules="[rules.required, rules.min]"
                :type="show1 ? 'text' : 'password'"
                hint="At least 6 characters"
                counter
                @click:append="show1 = !show1"
                label="Current password"
              ></v-text-field>
              <v-text-field
                outlined
                v-model="password"
                :append-icon="show2 ? 'visibility' : 'visibility_off'"
                :rules="[rules.required, rules.min]"
                :type="show2 ? 'text' : 'password'"
                hint="At least 6 characters"
                @click:append="show2 = !show2"
                label="New password"
              ></v-text-field>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn large color="primary" @click="updateData">Simpan</v-btn>
              </v-card-actions>
            </v-form>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    user: [],
    valid: true,
    nama: "",
    nidn: "",
    email: "",
    password: "",
    old_password: "",
    kategori: "Dosen",
    dialog: false,
    show1: false,
    show2: true,
    rules: {
          required: value => !!value || 'Required.',
          min: v => v.length >= 8 || 'Mininum 6 characters'
    }
  }),
  created() {
    this.getCurrentUser();
  },
  methods: {
    getData: function() {
      this.axios
        .get("/user?id=" + this.currentUser.id)
        .then(res => {
          this.user = res.data.data[0];
          this.nama = this.user.nama;
          this.email = this.user.email;
          this.nidn = this.user.nidn;
            this.old_password = this.user.password;
        })
        .catch(err => {
          console.log(err);
        });
    },
    updateData: function() {
      if (this.old_password == this.user.password) {
        let data = {
          id:this.id,
          nama: this.nama,
          nidn: this.nidn,
          email: this.email,
          password: this.password,
          kategori: this.kategori
        };

        this.axios
          .put("/user", data)
          .then(res => {
            this.getData();
            alert("Berhasil diupdate");
          })
          .catch(err => {
            console.log(err);
          });
      } else {
        this.dialog = true;
      }
    },
    getCurrentUser: function() {
      let userData = JSON.parse(localStorage.getItem("user"));
      this.currentUser = userData[0];
      this.getData();
    }
  }
};
</script>

<style lang="scss" scoped>
</style>


