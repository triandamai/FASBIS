<template>
  <div>
    <v-snackbar bottom :timeout="timeout" color="success" v-model="snackbarSuccess">
      <v-icon left color="white">done</v-icon>Artikel berhasil diedit
      <v-btn text @click="snackbarSuccess = false">Close</v-btn>
    </v-snackbar>

     <v-snackbar top:timeout="300" v-model="snackbarDelete">
      <v-icon left color="white">done</v-icon>Artikel berhasil dihapus
      <v-btn text @click="snackbarDelete = false">Close</v-btn>
    </v-snackbar>

    <div class="list__post">
      <div class="wrapper__flex">
        <v-text-field v-model="search" solo label="Cari artikel..." prepend-inner-icon="search"></v-text-field>

        <!-- <v-select
        solo
        v-model="kategori_post"
        :items="filter__items"
        label="Kategori"
        item-text="name"
        item-value="value"
        @change="onFilterPosts"
        ></v-select>-->

        <div class="btn__wrapper">
          <button
            v-for="(entry, index) in filterList"
            :item="entry"
            :key="index"
            @click="
          filter = entry;
          active = index;
        "
            :class="{ active: entry == filter }"
          >{{ entry }}</button>
        </div>
      </div>

      <div class="no__posts" v-if="items.length == 0">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="65"
          height="65"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
        >
          <path d="M20 11.08V8l-6-6H6a2 2 0 0 0-2 2v16c0 1.1.9 2 2 2h6" />
          <path d="M14 3v5h5M15.88 20.12l4.24-4.24M15.88 15.88l4.24 4.24" />
        </svg>
        <h1>Tidak ada daftar artikel disini.</h1>
      </div>

      <div class="list__post--entries" v-else>
        <h1 class="mb-5">Daftar artikel</h1>
        <div
          class="list__post--entries__grid"
          v-for="(item, index) in filteredItems"
          :key="index"
        >
          <img
            v-if="item.kategori != 'Event'"
            :src="'http://localhost/kp_amikom/uploads_artikel/'+item.gambar"
            alt
          />
          <!-- <img :src="item.gambar" alt /> -->
          <div class="body__text">
            <div class="body__text--inner">
              <h2>{{ item.title_post }}</h2>
              <v-chip class="my-3" small>
                <v-icon small left>calendar_today</v-icon>
                {{ item.date }} / {{ item.kategori }}
              </v-chip>
              <p
                v-if="item.kategori === 'Event'"
                class="body-2"
                v-html="$options.filters.truncate(item.body_post, 500)"
              ></p>
              <p v-else class="body-2" v-html="$options.filters.truncate(item.body_post, 300)"></p>
            </div>

            <div class="body__text--inner">
              <v-card-actions>
                <v-btn
                  dark
                  outlined
                  color="purple darken-3"
                  @click="updateConfirmation(item.id, item.title_post, item.body_post, item.kategori, item.gambar,item.type_gambar), dialogUpdate= true"
                >
                  <v-icon left small>edit</v-icon>Sunting artikel
                </v-btn>
                <v-btn color="red" dark @click="deleteConfirm(item.id)">
                  <v-icon dark left small>delete</v-icon>Hapus
                </v-btn>
              </v-card-actions>
            </div>
          </div>
        </div>
      </div>

      <!-- dialog hapus artikel -->
      <v-dialog v-model="dialogConfirm" max-width="500px">
        <v-divider></v-divider>
        <v-card class="pa-5">
          <v-card-text>
            <h1 style="line-height:1.5">Apakah kamu yakin ingin menghapus artikel ini?</h1>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn outlined @click="dialogConfirm = false">Batal</v-btn>
            <v-btn color="error" @click="deleteArticle(id), dialogConfirm= false">Hapus artikel</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <!-- dialog update artikel -->
      <v-dialog v-model="dialogUpdate" persistent max-width="1000px">
        <v-card class="pa-3">
          <v-card-text>
            <!-- <h2 class="mb-5">Sunting artikel</h2>
            <v-divider class="mb-5"></v-divider>-->

            <v-form ref="form">
              <v-container grid-list-lg>
                <v-layout row wrap>
                  <v-flex sm6 v-if="kategori != 'Event'">
                    <v-img
                      class="mb-2 mr-3 image_holder"
                      :src="'http://localhost/kp_amikom/uploads_artikel/' + gambar"
                    />
                  </v-flex>
                  <v-flex sm6>
                    <v-text-field outlined v-model="title_post" label="Judul post"></v-text-field>
                    <v-select
                      outlined
                      v-model="kategori"
                      :rules="[v => !!v || 'This is required']"
                      :items="kategori__items"
                      label="Kategori post..."
                      item-text="name"
                      item-value="value"
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

                    <!-- <v-textarea auto-grow no-resize outlined v-model="body_post"  label="Isi post"></v-textarea> -->
                  </v-flex>
                  <v-flex sm12>
                    <vue-editor v-model="body_post"></vue-editor>
                  </v-flex>
                </v-layout>
              </v-container>
            </v-form>
            <!-- <v-flex sm6>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem nulla impedit possimus blanditiis suscipit nihil consequatur quaerat recusandae beatae! Eligendi mollitia fugit quos, sed dignissimos ut sint earum ipsa beatae.
            </v-flex>-->
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn outlined text @click="dialogUpdate=false">Batal</v-btn>
            <v-btn color="primary" @click="updateArticle">Simpan</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
  </div>
</template>

<script>
import { VueEditor } from "vue2-editor";

export default {
  components: {
    VueEditor
  },
  data: () => ({
    id: "",
    title_post: "",
    body_post: "",
    kategori: null,
    kategori_post: null,
    gambar: null,
    items: [],
    fetchedItems:[],
    kategori__items: [
      { name: "Berita", value: "Berita" },
      { name: "Prestasi", value: "Prestasi" },
      { name: "Event", value: "Event" }
    ],
    dialogConfirm: false,
    dialogUpdate: false,
    snackbarSuccess: false,
    snackbarDelete:false,
    timeout: 2000,
    imageName: "",
    imageUrl: "",
    imageFile: "",
    imageType: "",
    form_data: {},
    isImageChange: "tidak",
    fkey: "kategori",
    filterList: ["Semua artikel", "Berita", "Event", "Prestasi"],
    filter: "Semua artikel",
    search:''
  }),
  mounted() {
    this.getArticle();
  },
  filters: {
    truncate: function(value, limit) {
      if (value.length > limit) {
        value = value.substring(0, limit - 3) + "...";
      }
      return value;
    }
  },
  computed: {
    filteredItems:function() {
       var self=this;
       return this.items.filter(function(item)
       {
         return item.title_post.toLowerCase().indexOf(self.search.toLowerCase())>=0;
         }
       );
    }
  },
  methods: {
    getArticle: function() {
      this.axios
        .get("/artikel")
        .then(response => {
          this.fetchedItems = response.data.data;
          this.fetchedItems.sort((a, b) => b.id - a.id); // descending
          console.log(this.items);
        })
        .catch(error => {
          console.log(error);
        });
    },
    updateArticle() {
      let data = {
        id: this.id,
        title_post: this.title_post,
        body_post: this.body_post,
        kategori: this.kategori,
        image: this.imageUrl,
        ext: this.imageType,
        isImageChange: this.isImageChange
      };
      this.axios
        .post("/artikelupdate", data)
        .then(res => {
          this.dialogUpdate = false;
          this.snackbarSuccess = true;
          this.getArticle();
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        });
    },
    deleteArticle(ida) {
      let data = {
        id: ida
      };
      this.axios
        .post("/hapusartikel", data)
        .then(response => {
          this.dialogConfirm = false;
          this.snackbarDelete = true;
          this.getArticle();
        })
        .catch(error => {
          console.log(error);
        });
    },
    deleteConfirm(id) {
      this.id = id;
      this.dialogConfirm = true;
    },
    updateConfirmation(id, title_post, body_post, kategori, gambar, tipe) {
      this.id = id;
      this.title_post = title_post;
      this.body_post = body_post;
      this.kategori = kategori;
      this.gambar = gambar;
      this.imageType = tipe;
    },
    onFilePicked(e) {
      const fr = new FileReader();
      this.isImageChange = "update";
      fr.readAsDataURL(e);
      fr.addEventListener("load", () => {
        this.imageUrl = fr.result;
        this.imageFile = e; // this is an image file that can be sent to server...
        this.imageType = e.type;

        console.log(fr.result);
      });
    },
    // resultsFilter(entry) {
    //   if (this.filter !== "Semua artikel") {
    //     if (entry[this.fkey] === this.filter) {
    //       return entry;
    //     }
    //   } else {
    //     return entry;
    //   }
    // }
  },
  watch: {
    fetchedItems:function() {
      this.items = this.fetchedItems;
    }, filter: function(val, oldVal) {
      this.items = val != "Semua artikel"
      ? this.fetchedItems.filter(f => f.kategori === val)
          : this.fetchedItems;
    }
  }
};
</script>


<style lang="scss" scoped>
@import "../../../assets/css/variables";
@import "../../../assets/css/mixins";

@-webkit-keyframes details-flow {
  0% {
    opacity: 0;
    margin-top: -1em;
  }
  100% {
    opacity: 1;
    margin-top: 0;
  }
}

@keyframes details-flow {
  0% {
    opacity: 0;
    margin-top: -1em;
  }
  100% {
    opacity: 1;
    margin-top: 0;
  }
}

.wrapper__flex {
  display: grid;
  align-items: center;
  grid-template-columns: 1fr 1fr;
  grid-gap: 0.5em;

  @include bp-medium() {
    grid-template-columns: 1fr;
    grid-gap: 0em;
  }

  .btn__wrapper {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    flex-wrap: wrap;
    margin-top: -2em;

    @include bp-medium() {
      margin-top: 0em;
      justify-content: flex-start;
    }

    & > button {
      display: block;
      padding: 0.5em 1em;
      border: 2px solid #1976d2;
      color: #1976d2;
      -webkit-border-radius: 30px;
      -moz-border-radius: 30px;
      border-radius: 30px;
      transition: 0.5s;
      margin: 0.35em 0.5em;
    }

    & > button.active {
      background: #1976d2;
      color: $white;
    }
  }
}

.no__posts {
  text-align: center;
  margin-top: 3.5em;
  padding: 5em 0;

  @include bp-medium() {
    padding: 0em 0;
  }

  svg {
    margin-bottom: 1.5em;
  }
}

.image_holder {
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
}

.v-btn {
  margin-right: 10px;
}

.list__post {
  padding: 1.5em;

  &--entries {
    margin-top: 1.5em;

    &__grid {
      -webkit-animation: details-flow 300ms ease-in-out;
      animation: details-flow 300ms ease-in-out;
      position: relative;
      display: grid;
      grid-template-columns: 500px 1fr;
      background-color: $white;
      margin-bottom: 2.5em;
      box-shadow: $box-shadow;

      @include bp-large() {
        grid-template-columns: 1fr;
      }

      img {
        width: 100%;
        height: 390px;
        object-fit: cover;
        object-position: center;
        @include bp-medium() {
          height: auto;
        }
      }

      .body__text {
        display: flex;
        flex-direction: column;
        justify-content: space-between;

        @include bp-medium() {
          justify-content: flex-start;
        }

        &--inner {
          padding: 1.5em;

          h2 {
            font-size: 1.35em;
          }
        }
      }
    }
  }
}
</style>