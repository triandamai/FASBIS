<template>
<div>
  <NavBar></NavBar>
  <Header></Header>
  <div class="container__p">
    <div class="container__p--inner">
      <Intro></Intro>
      <News></News>
    </div>
  </div>

  <Achievements />
  <Footer></Footer>
</div>
</template>

<script>
import Intro from "../Home/Intro";
import News from "../Home/News";
import Achievements from "../Home/Achievements";

import Header from '../../components/Header';
import NavBar from '../../components/NavBar'
import Footer from '../../components/Footer'

export default {
  name: "Home",
  components: {
    Header,
    NavBar,
    Footer,
    Intro,
    News,
    Achievements
  },
  metaInfo: {
    title: "Home | Prodi Teknik Informatika - Universitas Amikom Purwokerto",
    // override the parent template and just use the above title only
    titleTemplate: null
  }
};
</script>

<style lang="scss">
@import "../../assets/css/variables";
@import "../../assets/css/mixins";

h1,
h2,
h3 {
  font-family: $heading-font;
  font-weight: bold;
}

.container__p {
  &--inner {
    &-grid--3c {
      display:grid;
      grid-template-columns: repeat(3, 1fr);
      grid-gap: 3em;
      margin-bottom:3em;

      &::-webkit-scrollbar {
        display: none;
      }

      &:after {
        content: 'spacing';
        color:transparent;
      }

      @include bp-large() {
        -webkit-overflow-scrolling: touch;
        align-items: stretch;
        margin:0 -2em 3em -2em;
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        overflow-x: auto;
      }

      .grid__inner {
        background-color:$white;
        color:lighten($black, 45);
        padding:2.85em 2.5em 2.9em 2.5em;
        -webkit-border-radius: 15px;
        -moz-border-radius: 15px;
        border-radius: 15px;
        transition:400ms;
        cursor: pointer;

        h1, h2, h3 {
          color:$black;
        }

        &:hover {
          transform: scale(0.97);
        }

        @include bp-large() {
          padding:1.85em;
          max-width: 70%;
          flex-basis: 1;
          flex-grow: 0;
          flex-shrink: 0;
          margin-bottom:1em;

          & + .grid__inner {
            margin-left:2em;
          }

          &:first-child {
            margin-left:2em;
          }
        }

        @include box-shadow(4px, 8px, 15px, 0, lighten(#000, 90));
        text-align: center;
        h1 {
          font-size: 1.5em;
        }

        svg {
          margin-bottom:0.5em;
          color:$primary-color;
        }
      }
    }
  }
}

.container__maps {
  width:100%;
  height:75vh;
  background:grey;

  @include bp-medium() {
    height:65vh;
  }
}
</style>

