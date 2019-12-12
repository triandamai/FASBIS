<template>
  <div>
    <NavBar />
    <div>
      <div class="container__p">
        <div class="container__p--inner">
          <h1>Tentang kami</h1>
          <div class="container__p--inner-grid">
            <div class="container__p--inner-grid-c">
              Disiplin ilmu Teknik Informatika mempunyai bidang kajian sangat beragam dari yang sangat teoritis dan algoritmis, hingga yang bersifat sangat terapan seperti pengembangan robotika dan sistem cerdas. Terbagai menjadi tiga bagian utama
              <ul class="checklist__list">
                <li>
                  <font-awesome-icon :icon="['fas', 'check-circle']" />Fokus pada teori maupun algoritma yang dipergunakan dalam proses perancangan dan implementasi perangkat lunak
                </li>
                <li>
                  <font-awesome-icon :icon="['fas', 'check-circle']" />Fokus pada teori maupun algoritma yang dipergunakan dalam proses dan perancangan sistem perangkat keras serta komponennya
                </li>
                <li>
                  <font-awesome-icon :icon="['fas', 'check-circle']" />Fokus pada teori maupun algoritma yang dipergunakan sebagai model matematis dalam menyelesaikan permasalahan tertentu.
                </li>
              </ul>Kurikulum Teknik Informatika sangat kental dengan ilmu pengetahuan terkait dengan logika matematika, komputasi, dan algoritma yang dalam model terapannya dinyatakan dalam pengembangan program komputer.
            </div>
            <div class="container__p--inner-grid-c">
              <img role="presentation" src="../../assets/img/undraw__checklist.svg" alt />
            </div>
          </div>
        </div>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import NavBar from '../../components/NavBar'
import Footer from '../../components/Footer'
export default {
  name: "Tentang",
  components: {
      NavBar,
      Footer
  },
  metaInfo: {
    title: "Tentang kami | Prodi Teknik Informatika - Universitas Amikom Purwokerto"
  }
};
</script>

<style lang="scss" scoped>
@import "../../assets/css/variables";
@import "../../assets/css/mixins";

ul.checklist__list {
  margin-top: 1rem !important;
  margin-bottom: 1rem !important;
  background-color: lighten($primary-color, 56);
  padding: 1.25rem !important;

  -webkit-border-radius: 15px;
  -moz-border-radius: 15px;
  border-radius: 15px;

  li {
    margin-bottom: 0.5rem;
    svg {
      color: $primary-color;
      margin-right: 0.5rem;
    }
  }
}
</style>
