<template>
  <div>
    <header>
      <flickity v-if="Object.keys(slides).length > 0" ref="flickity" :options="flickityOptions">
        <div class="carousel-cell" v-for="(slide, index) in slides.slice(0,3)" :key="index">
          <div class="carousel-cell__inner">
            <div class="carousel-cell__inner--grid">
              <!-- <img src="../assets/img/placeholder.png" alt=""> -->
              <img :src="'http://localhost/kp_amikom/uploads_artikel/'+ slide.gambar" alt />
              <!-- <img :src="item.gambar" alt /> -->
            </div>
            <div class="carousel-cell__inner--grid">
              <div class="body__text">
                <h2>{{ slide.title_post }}</h2>
                <p v-html="$options.filters.truncate(slide.body_post, 180)"></p>
                <router-link :to="'/blog/' + slide.id" class="btn-go">Baca selengkapnya</router-link>
              </div>
            </div>
          </div>
        </div>
      </flickity>
    </header>
  </div>
</template>

<script>
import Flickity from "./Flickity.vue";
export default {
  components: {
    Flickity
  },
  data() {
    return {
      slides: [],
      flickityOptions: {
        pageDots: false,
        prevNextButtons: false,
        autoPlay: 5000,
        wrapAround: true

        // any options from Flickity can be used
      }
    };
  },
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
  methods: {
    next() {
      this.$refs.flickity.next();
    },
    previous() {
      this.$refs.flickity.previous();
    },
    getArticle: function() {
      this.axios
        .get("/artikel?kategori=Berita")
        .then(response => {
          this.slides = response.data.data;
        })
        .catch(err => {
          // console.log(err);
        });
    }
  }
};
</script>


<style lang="scss" scoped>
@import "../assets/css/variables";
@import "../assets/css/mixins";
$header-bg: #ddd;

header {
  width: 100%;
  background: rgb(102, 59, 177);
  background: linear-gradient(45deg, #663bb1 0%, #f5853f 100%);
  // background-image:url('../assets/img/header_h.jpg');
  background-size: cover;
  background-attachment: fixed;
  font-family: $body-font;
}

.carousel-cell {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: calc(80vh + 1rem);
  padding: 0 5vw;

  @include bp-small() {
    height: 80vh;
    padding: 0 0;
  }

  &__inner {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 0 3.5em;

    @media (max-width: 60rem) {
      flex-direction: column;
      margin: 0 2em;
    }

    &--grid {
      position: relative;
      flex: 1;

      img {
        width: 100%;
        display: block;
      }

      .body__text {
        padding: 1.5em 2em;
        color: $white;

        @media (max-width: 60rem) {
          padding: 1.5em 0em;
        }

        h2 {
          font-family: $heading-font;
          font-weight: bold;
          font-size: 1.35em;
          margin-bottom: 0.5em !important;

          @include bp-medium() {
            font-size: 1em;
          }
        }

        .btn-go {
          display: block;
          margin: 2em 0 0 0;
          max-width: 12rem;
          text-decoration: none;
          font-family: $heading-font;
          font-size: 0.85em;
          font-weight: bold;
          text-align: center;
          padding: 0.65em 0.45em;
          background-color: $black;
          border: 3px solid $black;
          color: $white;
          -webkit-border-radius: 30px;
          -moz-border-radius: 30px;
          border-radius: 30px;
          transition: 0.5s;
          -moz-transition: 0.5s;

          &:hover {
            background-color: transparent;
            border: 3px solid $white;
          }
        }
      }
    }
  }
}
</style>

