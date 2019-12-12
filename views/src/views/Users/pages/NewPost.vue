<template>
  <div>
    <v-form v-model="valid">
      <v-container>
        <v-card class="pa-5">
          <v-card-text class="pa-5">
            <h1 class="mb-5 black--text">Blog Posts</h1>
            <v-divider class="my-5"></v-divider>
            <v-text-field
              outlined
              v-model="title_post"
              :rules="judul__postRules"
              :counter="200"
              label="Judul post"
              required
            ></v-text-field>

            <v-select
              outlined
              v-model="kategori"
              :rules="[v => !!v || 'This is required']"
              :items="kategori__items"
              label="Kategori post..."
              item-text="name"
              item-value="value"
              @change="onSelected"
              required
            ></v-select>

            <v-file-input
              v-if="kategori != 'Event'"
              outlined
              accept="image/png, image/jpeg, image/bmp"
              placeholder="Pilih gambar..."
              prepend-inner-icon="mdi-camera"
              label="Gambar artikel"
              ref="files"
              type="file"
              @change="onFilePicked"
            ></v-file-input>
            
            <div class="editor__wrapper">
              <vue-editor v-model="body_post"></vue-editor>
            </div>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn large dark color="purple darken-3" @click="saveArticle">Submit</v-btn>
            </v-card-actions>
          </v-card-text>
        </v-card>
      </v-container>
    </v-form>
  </div>
</template>

<script>
import { VueEditor } from "vue2-editor";

export default {
  components: {
    VueEditor
  },
  data: () => ({
    valid: false,
    title_post: "",
    body_post: "",
    kategori: null,
    gambar: null,
    judul__postRules: [
      v => !!v || "Judul harus diisi",
      v => v.length <= 200 || "Judul harus kurang dari 200"
    ],
    kategori__items: [
      { name: "Berita", value: "Berita" },
      { name: "Prestasi", value: "Prestasi" },
      { name: "Event", value: "Event" }
    ],
    articles: [],
    imageName: "",
    imageUrl: "",
    imageFile: "",
    imageType: "",
    form_data: {},
    currentUser: ""
  }),
  created() {
    this.getCurrentUser();
  },
  mounted() {
    this.getArticle();
  },
  methods: {
    checkKategori(value) {
      this.kategori = value;
    },
    getCurrentUser: function() {
      let userData = JSON.parse(localStorage.getItem("user"));
      this.currentUser = userData[0];
    },
    getArticle() {
      this.axios
        .get("/artikel")
        .then(response => {
          this.articles = response.data.data;
        })
        .catch(err => {
          // console.log(err);
        });
    },
    saveArticle() {
      let data = {
        title_post: this.title_post,
        body_post: this.body_post,
        kategori: this.kategori,
        image: this.imageUrl,
        ext: this.imageType,
        id_user: this.currentUser.id
      };

      this.axios
        .post("/artikel", data)
        .then(response => {
          this.$router.replace(this.$route.query.redirect || "/dashboard/list_posts");
          // console.log(response.data);
        })
        .catch(err => {
          console.log(err + " Gagal mengirim post heh...");
        });
    },
    onFilePicked(e) {
      const fr = new FileReader();
      fr.readAsDataURL(e);
      fr.addEventListener("load", () => {
        this.imageUrl = fr.result;
        this.imageFile = e; // this is an image file that can be sent to server...
        this.imageType = e.type;
        // console.log(fr.result)
      });
    }
  }
};
</script>

<style scoped>
.editor__wrapper {
  margin:0em 0 1.5em 0;
}
</style>