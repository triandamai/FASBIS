<template>
  <div>
    <NavBar />
    <div class="container__p">
      <div class="container__p--inner">
        <h2>Sambutan Kepala Bagian</h2>
        <p>
          Assalamu’alaikum warohmatullohi wabarokatuh
          <br />
          <br />Selamat datang di Website resmi Program Studi Teknik Informatika STMIK AMIKOM Purwokerto. Website ini diharapkan menjadi sebuah media informasi bagi masyarakat untuk lebih mengenal STMIK AMIKOM Purwokerto terutama Program Studi Teknik Informatika.
          <br />
          <br />Program Studi Teknik Informatika STMIK AMIKOM Purwokerto berdiri sejak tahun 2005. Berkat kerjasama dan dukungan dari seluruh civitas akademika, Prodi TI semakin berkembang ke arah yang lebih baik. Salah satunya adalah prestasi Prodi TI yang mendapatkan akreditasi B dari BAN PT. Prestasi ini tidak terlepas dari keseriusan Prodi TI untuk memberikan yang terbaik dalam memberikan pelayanan kepada mahasiswa, baik dalam bidang pengembangan akademik maupun dalam perngembangan bidang penelitian dan pengabdian.
          <br />Teknik Infomatika STMIK AMIKOM Purwokerto mempunyai tiga konsentrasi unggulan yang sesuai dengan kebutuhan industri IT yaitu, Software Engineering, Multimedia dan Artificial Intelegence. Dibimbing oleh dosen-dosen yang berkualitas baik dari dalam maupun luar negeri dan didukung oleh sarana laboratorium yang lengkap, mahasiswa disiapkan menjadi sarjana dengan keunggulan menjadi: Programmer, Konsultan IT, Sistem Analis, Animator, Database Engineering, Softrware Tester, Game Developer dan Technopreneur.
          <br />
          <br />Alumni dilengkapi dengan sertifikasi internasional dari Foresec, Microsoft Technology Associate, Adobe Certifield Associate, CIBIA, CISCO dan CERTIPORT serta sertifikasi bahasa Inggris, sehingga lulusan Prodi TI diakui secara Internasional dan dapat bersaing pada Masyarakat Ekonomi Asean (MEA).
          Terima kasih atas perhatian Anda.
          <br />Semoga bermanfaat.
          <br />
          <br />Wassalamu’alaikum warohmatullohi wabarokatuh
        </p>
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