<template>
  <div class="main_wrapper">
    <div class="grid__wrapper">
      <div class="grid__wrapper--heading">
        <h1>Berita terkini</h1>
        <button aria-describedby="Baca selengkapnya">
          <router-link to="/blog">
            <span>Baca selengkapnya</span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="square"
              stroke-linejoin="arcs"
            >
              <path d="M5 12h13M12 5l7 7-7 7" />
            </svg>
          </router-link>
        </button>
      </div>

      <div class="grid__wrapper--news" v-for="(item, i) in items.slice(0,4)" :key="i">
        <div class="flex-item">
          <div>
            <img :src="'http://localhost/kp_amikom/uploads_artikel/'+item.gambar" alt />
            <!-- <img :src="item.gambar" alt /> -->
          </div>
          <div>
            <h2>{{ item.title_post }}</h2>
            <p v-html="$options.filters.truncate(item.body_post, 250)"></p>
            <router-link :to="'/blog/' + item.id" class="btn-go">
              Baca selengkapnya
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="22"
                height="22"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="square"
                stroke-linejoin="arcs"
              >
                <path d="M7 17l9.2-9.2M17 17V7H7" />
              </svg>
            </router-link>
          </div>
        </div>
      </div>
    </div>

    <div class="grid_agenda">
      <h1>Agenda terbaru</h1>
      <div class="list-agenda" v-for="(a, i) in agenda.slice(0,6)" :key="i">
        <div class="list-agenda-tgl">
          <div class="list-agenda-tgl__bulan">{{ a.date | formatMonth }}</div>
          <div class="list-agenda-tgl__hari">{{ a.date.slice(-2) }}</div>
        </div>
        <router-link :to="'/agenda/' + a.id">
          <div class="list-agenda-ket">
            <h2>{{ a.title_post }}</h2>
            <p v-html="$options.filters.truncate(a.body_post, 50)"></p>
          </div>
        </router-link>
      </div>
      <router-link to="/agenda" class="agenda-btn">Lihat selengkapnya</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    items: [],
    agenda: []
  }),
  mounted() {
    this.getArticle();
    this.getAgenda();
  },
  filters: {
    truncate: function(value, limit) {
      if (value.length > limit) {
        value = value.substring(0, limit - 3) + "...";
      }
      return value;
    },
    formatMonth(date) {
      date = new Date(date);
      let month = date.getMonth() + 1;
      if (month == "01") {
        month = "Jan";
      } else if (month == "02") {
        month = "Feb";
      } else if (month == "03") {
        month = "Mar";
      } else if (month == "04") {
        month = "Apr";
      } else if (month == "05") {
        month = "Mei";
      } else if (month == "06") {
        month = "Jun";
      } else if (month == "07") {
        month = "Jul";
      } else if (month == "08") {
        month = "Aug";
      } else if (month == "09") {
        month = "Sep";
      } else if (month == "10") {
        month = "Okt";
      } else if (month == "11") {
        month = "Nov";
      } else if (month == "12") {
        month = "Des";
      }

      return `${month}`;
    }
  },
  methods: {
    getArticle: function() {
      this.axios
        .get("/artikel?kategori=Berita")
        .then(response => {
          this.items = response.data.data;
          this.items.sort((a, b) => b.id - a.id);
        })
        .catch(err => {
          // console.log(err);
        });
    },
    getAgenda: function() {
      this.axios
        .get("/artikel?kategori=Event")
        .then(response => {
          this.agenda = response.data.data;
          this.agenda.sort((a, b) => b.id - a.id);
          // for (let i = 0; i < this.agenda.length; i++) {
          //   let tgl = this.agenda[i].date.substring(5, 7);
          //   if (tgl == "01") {
          //     tgl = "Jan";
          //   } else if (tgl == "02") {
          //     tgl = "Feb";
          //   } else if (tgl == "03") {
          //     tgl = "Mar";
          //   } else if (tgl == "04") {
          //     tgl = "Apr";
          //   } else if (tgl == "05") {
          //     tgl = "Mei";
          //   } else if (tgl == "06") {
          //     tgl = "Jun";
          //   } else if (tgl == "07") {
          //     tgl = "Jul";
          //   } else if (tgl == "08") {
          //     tgl = "Aug";
          //   } else if (tgl == "09") {
          //     tgl = "Sep";
          //   } else if (tgl == "10") {
          //     tgl = "Okt";
          //   } else if (tgl == "11") {
          //     tgl = "Nov";
          //   } else if (tgl == "12") {
          //     tgl = "Des";
          //   }

          //   console.log(tgl);
          // }
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

.list-agenda {
  display: flex;
  flex-direction: row;
  margin-top: 1.5em;

  a {
    color: $black;
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }

  &-tgl {
    margin-right: 1em;
    background-color: $primary-color;

    &__bulan {
      padding: 0.5em 1.2em;
      background-color: rgba($black, 0.5);
      color: $white;
      text-align: center;
      font-weight: bold;
    }

    &__hari {
      padding: 0.5em 0em;
      font-size: 1.4em;
      font-weight: bold;
      text-align: center;
      color: rgba($white, 0.95);
    }
  }

  &-ket {
    font-size: 0.85em;
  }
}

.agenda-btn {
  display: block;
  margin-top: 1em;
  border: 1px solid $primary-color;
  padding: 0.55em 1em;
  text-decoration: none;
  font-weight: bold;
}

.main_wrapper {
  display: grid;
  grid-template-columns: 1fr 350px;
  grid-gap: 2.5em;

  @include bp-medium() {
    grid-template-columns: 1fr;
    grid-gap: 1em;
  }
}

.grid_agenda {
  padding: 0em 2.5em 0.5em 2.5em;

  @include bp-medium() {
    padding: 0em;
    margin: 2em 0;
  }

  h1 {
    font-size: 1.65em;
  }
}

.flex-item {
  display: grid;
  grid-gap: 1.5em;
  grid-template-columns: 300px 1fr;

  @include bp-medium() {
    grid-template-columns: 1fr;
    grid-gap: 1em;
  }
}

.grid__wrapper {
  display: grid;
  grid-template-columns: 1fr;
  grid-gap: 3.5rem;
  margin-bottom: 2.5em;

  &--heading {
    grid-column: 1/-1;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;

    h1 {
      font-size: 1.85em;
    }

    button {
      background-color: $secondary-color;
      color: rgba($white, 0.95);
      font-size: 0.95em;
      font-weight: bold;
      padding: 0.5rem 1rem;
      -webkit-border-radius: 30px;
      -moz-border-radius: 30px;
      border-radius: 30px;
      @include transition(400ms ease-in-out);

      &:hover {
        background-color: darken($secondary-color, 25);
      }

      a {
        color: $white;
        text-decoration: none;
      }

      @include bp-medium() {
        span {
          display: none;
        }
      }

      svg {
        display: inline-block;
        margin-left: 0.5em;
        vertical-align: middle;
      }
    }
  }

  &--news {
    background-color: $white;
    padding: 2em 2.5em 3.5em 2.5em;
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    border-radius: 15px;
    @include box-shadow(4px, 8px, 15px, 0, lighten(#000, 90));

    h2 {
      font-size: 1.26em;
      color: $black;
    }

    img {
      margin-bottom: 1em;
      -webkit-border-radius: 8px;
      -moz-border-radius: 8px;
      border-radius: 8px;
    }

    position: relative;
    color: lighten($black, 45);
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    border-radius: 15px;

    a.btn-go {
      display: block;
      margin-top: 0.5em;
      font-weight: bold;
      color: $primary-color;

      svg {
        vertical-align: middle;
        margin-left: 0em;
      }
    }
  }

  @include bp-large {
    grid-template-columns: 1fr;
  }
}
</style>
