<template>
  <div class="container__achievement">
    <div class="container__achievement--inner">
      <div class="container__achievement--inner-heading">
        <h1>Prestasi sebelumnya</h1>
         <router-link to="/prestasi" class="btn_more">
          <span>Baca selengkapnya</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="square"
            stroke-linejoin="arcs"
          >
            <path d="M5 12h13M12 5l7 7-7 7" />
          </svg>
         </router-link>
      </div>
      <div
        class="container__achievement--inner-grid"
        v-for="(item, i) in items.slice(0,3)"
        :key="i"
      >
        <img :src="'http://localhost/kp_amikom/uploads_artikel/'+item.gambar" alt />
        <div class="body__text">
          <h2>{{ item.title_post }}</h2>
          <p v-html="$options.filters.truncate(item.body_post,190)"></p>
          <router-link :to="'/blog/' + item.id" class="btn-go">Baca selengkapnya</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    items: []
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
  methods: {
    getArticle: function() {
      this.axios
        .get("/artikel?kategori=Prestasi")
        .then(response => {
          this.items = response.data.data;
          this.items.sort((a, b) => b.id - a.id);
        })
        .catch(err => {
          // console.log(err);
        });
    }
  }
};
</script>


<style lang="scss" scoped>
@import "../../assets/css/variables";
@import "../../assets/css/mixins";

h1,
h2,
h3,
h4 {
  font-family: $heading-font;
  font-weight: bold;
}

.container__achievement {
  font-family: $body-font;
  background: rgb(102, 59, 177);
  background: linear-gradient(
    45deg,
    rgba(102, 59, 177, 1) 0%,
    rgba(245, 133, 63, 1) 100%
  );
  padding: 5.5em 2em;

  @include bp-medium() {
    padding: 2.5em 1.5em;
  }

  &--inner {
    max-width: 85vw;
    margin: auto;

    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-gap: 1.5em;

    @include bp-medium() {
      grid-template-columns: 1fr;
      grid-gap: 2em;
    }

    &-heading {
      display: flex;
      justify-content: space-between;
      align-items: center;
      grid-column: 1/-1;
      color: rgba($white, 0.95);
      margin-bottom: 1em;

      @include bp-medium() {
        span {
          display: none;
        }
      }

      h1 {
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 1px;
        -webkit-text-stroke-color: $white;
      }

      .btn_more {
        text-decoration: none;
        font-weight: bold;
        background-color: transparent;
        color: $white;
        border: 3px solid currentColor;
        padding: 0.5em 1em;
        -webkit-border-radius: 30px;
        -moz-border-radius: 30px;
        border-radius: 30px;

        svg {
          vertical-align: middle;
        }
      }
    }

    &-grid {
      position: relative;
      overflow: hidden;
      background-color: $white;
      @include box-shadow(4px, 8px, 15px, 0, rgba(#111, 0.25));
      -webkit-border-radius: 13px;
      -moz-border-radius: 13px;
      border-radius: 13px;
      @include transition(400ms ease-out);

      &:hover {
        transform: translateY(-2%);
      }

      img {
        object-fit: cover;
        object-position: center;
        width: 100%;
        height: 300px;
        display: block;
      }

      .body__text {
        font-size: 0.9em;
        padding: 1.5em 2em;
        color: rgba($black, 0.85);

        h2 {
          margin-bottom: 0.5em !important;
        }

        a.btn-go {
          color: $primary-color;
          display: block;
          margin-top: 0.5em;
          font-weight: bold;
        }
      }
    }
  }
}
</style>
