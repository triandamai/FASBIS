<template>
<div>
  <NavBar></NavBar>
  <div class="container__p">
      <div class="container__p--inner">
          <h1>404 Halaman tidak bisa ditemukan</h1>
          Halaman tidak bisa ditemukan. Silahkan klik tombol beranda di atas untuk memuat ulang halaman utama.
      </div>
  </div>
  <Footer/>
</div>
</template>

<script>
import NavBar from '../components/NavBar'
import Footer from '../components/Footer'
export default {
    components: {
      NavBar,
      Footer
    },
    metaInfo: {
    title: "404 Halaman tidak ditemukan | Prodi Teknik Informatika - Universitas Amikom Purwokerto"
  }
};
</script>