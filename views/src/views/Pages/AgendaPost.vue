<template>
  <div>
    <NavBar></NavBar>
    <div class="container__p">
      <div class="container__p--inner">
        <div class="blog-wrapper">
          <div class="blog-wrapper__grid">
            <!-- <img :src="'http://localhost/kp_amikom/uploads_artikel/'+items[0].gambar" alt /> -->
            <div class="blog-wrapper__grid--date">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                <line x1="16" y1="2" x2="16" y2="6" />
                <line x1="8" y1="2" x2="8" y2="6" />
                <line x1="3" y1="10" x2="21" y2="10" />
              </svg>
              Posted
              on {{ items[0].date }} / {{ items[0].id }}
            </div>
            <h2>{{ items[0].title_post }}</h2>
            <p v-html="items[0].body_post"></p>
          </div>
        </div>
      </div>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
// import Header from "../../components/Header";
import NavBar from "../../components/NavBar";
import Footer from "../../components/Footer";

export default {
  name: "blog-posts",
  components: {
    // Header,
    NavBar,
    Footer
  },
  data: () => ({
    items: [
      {
        title_post: "",
        body_post: "Halaman Tidak ditemukan",
        date: "",
        gambar: ""
      }
    ]
  }),
  mounted() {
    this.getArticle();
  },
  methods: {
    getArticle: function() {
      console.log("ID Post: " + this.$route.params.id);
      this.axios
        .get("/artikelfull?id=" + this.$route.params.id)
        .then(response => {
          //datanya array jadi harus diambil index yang ke satu
          this.items = response.data.data;
          console.log(this.items);
        })
        .catch(err => {
          // console.log(err);
        });
    }
  },
  metaInfo: {
    title: "Prodi Teknik Informatika - Universitas Amikom Purwokerto",
    // override the parent template and just use the above title only
    titleTemplate: null
  }
};
</script>

<style lang="scss" scoped>
@import "../../assets/css/variables";
@import "../../assets/css/mixins";

.blog-wrapper {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  grid-gap: 3.5em;
  margin-bottom: 2.5em;

  @include bp-medium() {
    grid-template-columns: 1fr;
    grid-gap: 1.5em;
  }

  &__heading {
    grid-column: 1/-1;

    h1 {
      svg {
        vertical-align: text-top;
        margin-right: 0.5em;
        @include bp-medium() {
          vertical-align: -10px;
          width: 25px;
        }
      }

      @include bp-medium() {
        font-size: 1.4em;
      }
    }
  }

  &__grid {
    color: lighten($black, 25);

    h1,
    h2,
    h3 {
      color: $black;
    }

    img {
      @include box-shadow(4px, 8px, 15px, 0, lighten(#000, 90));
      -webkit-border-radius: 8px;
      -moz-border-radius: 8px;
      border-radius: 8px;
      margin-bottom: 1.5em;
    }

    a {
      color: $primary-color;
      font-weight: bold;
    }

    &--date {
      margin-bottom: 1em;

      svg {
        vertical-align: -6px;
        margin-right: 0.5em;
      }
    }
  }
}
</style>

