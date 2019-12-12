<template>
  <div>
    <v-container>
      <v-layout row wrap>

        <v-flex sm12>
          <v-card class="py-5" flat color="transparent">
            <v-card-text class="py-5">
              <h1 class="black--text font-weight-bold my-2">Selamat datang di halaman administrator, <span class="purple--text">{{ currentUser.nama }}</span> </h1>
            </v-card-text>
          </v-card>
        </v-flex>

        <v-flex sm4>
          <v-card class="pa-5" color="orange darken-3" dark>
            <v-card-text>
              <div class="display-3 font-weight-bold mb-1 white--text">{{ dosenLength }}</div>
              <v-divider class="orange lighten-4 my-2"></v-divider>
              <div class="subheading font-weight-medium white--text">Jumlah pengguna</div>
            </v-card-text>
          </v-card>
        </v-flex>
        <v-flex sm8>
          <v-card class="pa-5">
            <v-card-text>
              <span class="body-1">
                <div class="display-3 font-weight-bold mb-1 black--text">{{ articleLength }}</div>
                <v-divider class="grey lighten-2 my-2"></v-divider>
                <div class="subheading font-weight-medium">Jumlah artikel yang dipublikasikan</div>
              </span>
            </v-card-text>
          </v-card>
        </v-flex>

        <!-- <v-flex sm12>
          <v-card dark class="blue-grey darken-3">
            <v-card-text class="px-5 py-5">
              <v-sparkline
                :value="value"
                color="rgba(255, 255, 255, .7)"
                height="100"
                padding="10"
                line-width="2"
                stroke-linecap="round"
                smooth
              >
                <template v-slot:label="item">{{ item.value }}</template>
              </v-sparkline>
            </v-card-text>
            <v-card-text class="pt-0">
              <div class="title font-weight-light mb-2">User Registrations</div>
              <div class="subheading font-weight-light grey--text">Last Campaign Performance</div>
              <v-divider class="my-2"></v-divider>
              <span class="caption grey--text font-weight-light">last registration 26 minutes ago</span>
            </v-card-text>
          </v-card>
        </v-flex> -->
      </v-layout>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    value: [1, 7, 10, 0, 0, 4, 2],
    articleLength: "",
    dosenLength: "",
    currentUser:""
  }),
  mounted() {
    this.getDataUser();
    this.getArticleLength();
    this.getDosen();
  },
  methods: {
    getArticleLength: function() {
      this.axios
        .get("/artikel")
        .then(response => {
          this.articleLength = response.data.data.length;
        })
        .catch(err => {
          // console.log(err);
        });
    },
    getDosen: function() {
      this.axios
        .get("/user")
        .then(response => {
          this.dosenLength = response.data.data.length;
        })
        .catch(err => {
          // console.log(err);
        });
    },
    getDataUser: function() {
      let data = JSON.parse(localStorage.getItem("user"));
      this.currentUser = data[0];
    }
  }
};
</script>
