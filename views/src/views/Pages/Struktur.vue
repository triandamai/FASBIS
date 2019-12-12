<template>
  <div>
    <NavBar />
    <div class="container__p">
      <div class="container__p--inner">
        <h2>Sambutan Kepala Bagian</h2>
        <img src="../../assets/img/struktur.jpg" alt="Struktur" />
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import NavBar from "../../components/NavBar";
import Footer from "../../components/Footer";
export default {
  components: {
    NavBar,
    Footer
  }
};
</script>

<style scoped>
.container__p--inner {
  text-align: justify !important;
}
</style>