<template>
  <div>
    <NavBar></NavBar>
    <div class="container__p">
      <div class="container__p--inner">
        <div class="blog-wrapper">
          <!-- <div class="blog-wrapper__heading">
            <h1>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="36"
                height="36"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path
                  d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"
                />
              </svg> Berita terkini
            </h1>
          </div> -->
          <div class="blog-wrapper__grid" v-for="(item, index) in items" :key="item.id + '_' + index">
            <div class="blog-wrapper__grid--date">
              <div class="tgl_p">
                {{ item.date.slice(-2) }}
              </div>
              <div class="thn_p">
                {{ item.date.substring(0, 4) }}
              </div>
            </div>
            <div class="blog-wrapper__grid--body">
              <h2>{{ item.title_post }}</h2>
              <p v-html="$options.filters.truncate(item.body_post, 250)"></p>
             <router-link :to="'/agenda/' + item.id" class="btn-go">Baca selengkapnya</router-link>
            </div>
          </div>

            <div class="blog-wrapper__pagination">
            <ul>
              <li>
                <button :disabled="pagination.index == 0" @click="prevStep">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="32"
                    height="32"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="square"
                    stroke-linejoin="arcs"
                  >
                    <path d="M19 12H6M12 5l-7 7 7 7" />
                  </svg> Previous post
                </button>
              </li>
              <li>
                <div class="current_page">Page {{pagination.index+1}} of {{pagination.length}}</div>
              </li>
              <li>
                <button :disabled="pagination.index == pagination.length-1" @click="nextStep">
                  Next post
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="32"
                    height="32"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="square"
                    stroke-linejoin="arcs"
                  >
                    <path d="M5 12h13M12 5l7 7-7 7" />
                  </svg>
                </button>
              </li>
            </ul>
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
  name: "Blog",
  components: {
    // Header,
    NavBar,
    Footer
  },
  data: () => ({
    items: [],
    items_chunk: [],
    pagination: {
      index: 0,
      length: 0,
      show: 0
    },
    disablednext: false,
    disabledprev: false
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
    splitData: function(array, size) {
      const chunked_arr = [];
      for (let i = 0; i < array.length; i++) {
        const last = chunked_arr[chunked_arr.length - 1];
        if (!last || last.length === size) {
          chunked_arr.push([array[i]]);
        } else {
          last.push(array[i]);
        }
      }
      return chunked_arr;
    },
    nextStep: function() {
      window.scrollTo({
        top: document.body.offsetTop,
        left: 0,
        behavior: "smooth"
      });
      //    console.log(this.pagination.index+1)
      if (this.pagination.index == this.pagination.length - 1) {
      } else {
        return this.pagination.index++;
      }
    },
    prevStep: function() {
      window.scrollTo({
        top: document.body.offsetTop,
        left: 0,
        behavior: "smooth"
      });
      if (this.pagination.index == 0) {
      } else {
        return this.pagination.index--;
      }
    },
    getArticle: function() {
      this.axios
        .get("/artikel?kategori=Event")
        .then(response => {
          this.items = response.data.data;
          this.items_chunk = this.splitData(response.data.data, 4);
          this.pagination.length = this.splitData(response.data.data, 4).length;
        })
        .catch(err => {
          // console.log(err);
        });
    }
  },
  metaInfo: {
    title:
      "Berita Terkini | Prodi Teknik Informatika - Universitas Amikom Purwokerto",
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
  grid-template-columns: repeat(2, 1fr);
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
    display: grid;
    grid-template-columns: 100px 1fr;

    img {
      @include box-shadow(4px, 8px, 15px, 0, lighten(#000, 90));
      -webkit-border-radius: 8px;
      -moz-border-radius: 8px;
      border-radius: 8px;
      margin-bottom: 1.5em;
    }

    @include bp-medium() {
      margin:0.85em 0;
    }

    &--date {
      margin-bottom: 1em;
      font-family: $heading-font;

      .tgl_p {
        font-weight: bold;
        font-size: 2em;
      }

      .thn_p {
        color:$primary-color;
        font-weight: bold;
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
      background-color: $primary-color;
      border: 3px solid $primary-color;
      color: $white;
      -webkit-border-radius: 30px;
      -moz-border-radius: 30px;
      border-radius: 30px;
      transition: 0.5s;
      -moz-transition: 0.5s;

      &:hover {
        background-color: $black;
      }
    }
  }

  &__pagination {
    grid-column: 1/-1;
    margin-top: 3.5em;

    ul {
      display: flex;
      justify-content: center;
      align-items: center;

      li {
        button {
          background-color: #111;
          color: $white;
          padding: 0.5em 1.25em;
          -webkit-border-radius: 30px;
          -moz-border-radius: 30px;
          border-radius: 30px;
          svg {
            vertical-align: middle;
          }
          &:disabled {
            background-color: #ddd;
            color: $black;
            cursor: not-allowed;
            opacity: 0.5;
          }
        }

        .current_page {
          padding: 0.8em 1em;
          margin: 0 1.5em;
        }
      }
    }
  }
}
</style>


