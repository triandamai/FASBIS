<template>
  <div>
    <v-container class="pa-5">
      <v-app>
        <v-snackbar bottom :timeout="timeout" color="success" v-model="snackbar">
          <v-icon left color="white">done</v-icon>Surat berhasil dikirim
          <v-btn text @click="snackbar = false">Close</v-btn>
        </v-snackbar>

        <v-snackbar bottom color="success" v-model="snackbarDelete">
          <v-icon left color="white">done</v-icon>Dosen berhasil dihapus
          <v-btn text @click="snackbarDelete = false">Close</v-btn>
        </v-snackbar>

        <v-card-title>
          <!-- <v-btn class="ma-2" dark color="primary" @click="kirimConfirmBanyak">
            <v-icon left>mdi-mail</v-icon>Kirim surat Ke Banyak
          </v-btn>

          <v-btn dark color="blue-grey darken-3" @click="dialogAdd = true">
            <v-icon left>add</v-icon>Tambah Dosen
          </v-btn>-->
          <v-spacer></v-spacer>
          <v-text-field
            v-model="search"
            append-icon="search"
            label="Search"
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>
        <v-data-table
          :headers="headers"
          :items="surat"
          item-key="id"
          :search="search"
          class="elevation-1"
        >
          <template v-slot:item.action="{ item }">
            <v-btn class="ma-2" dark color="primary">
              <v-icon left>mdi-mail</v-icon>Lihat surat
            </v-btn>
            <v-btn class="ma-2" outlined color="success">
              <v-icon left>mdi-pencil</v-icon>Edit
            </v-btn>
            <v-btn class="ma-2" dark color="error">
              <v-icon left>mdi-delete</v-icon>Hapus
            </v-btn>
          </template>
        </v-data-table>
      </v-app>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    headers: [
      {
        text: "Nama",
        align: "left",
        sortable: true,
        value: "dari"
      },
      { text: "Penerima", value: "penerima", sortable: false },
      { text: "Kode Surat", value: "surat", sortable: false }
    ],

    tipe_items: [
      { name: "Undangan Dari Rektor Universitas", value: "P" },
      {
        name: "Surat Pengantar Fakultas Bisnis dan Ilmu Sosial",
        value: "FASBIS"
      }
    ],
    tipe_perihal: [
      { name: "Surat Dosen", value: "01" },
      { name: "Memo", value: "02" },
      { name: "Surat Pengantar", value: "03" },
      { name: "Surat Edaran", value: "04" },
      { name: "Surat Undangan", value: "05" },
      { name: "Surat Tugas", value: "06" },
      { name: "Surat Kuasa", value: "07" },
      { name: "Surat Pengumuman", value: "08" },
      { name: "Surat Pernyataan", value: "09" },
      { name: "Surat Keterangan", value: "10" },
      { name: "Surat Keputusan", value: "11" },
      { name: "Surat Permohonan", value: "12" },
      { name: "Surat Peringatan", value: "13" },
      { name: "Surat Peminjaman", value: "14" },
      { name: "Surat Perjanjian", value: "15" },
      { name: "Berita Acara", value: "16" }
    ],
    perihal: "",
    dosen: [],
    surat: [],
    show: false,
    valid: true,
    lazy: false,
    emailValid: "",
    search: "",
    tipe_surat: null,
    snackbar: false,
    snackbarDelete: false,
    timeout: 2000,
    nama: "",
    nidn: "",
    email: "",
    password: "",
    kategori: "Dosen",
    judul_surat: "",
    jenis_surat: "",
    file_surat: null,
    suratURL: "",
    suratFile: "",
    suratType: "",
    urutan_surat: "",
    id_user: "",
    filter: "Dosen",
    selected: [],
    Email: ""
  }),
  created() {
    this.getCurrentUser();
    this.getData();
  },

  methods: {
    getData() {
      var data = {
        id_user: this.currentUser.id
      };

      this.axios
        .get("history?id_user=" + this.currentUser.id)
        .then(res => {
          if (res.data.success) {
            this.surat = res.data.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    getCurrentUser: function() {
      let userData = JSON.parse(localStorage.getItem("user"));
      this.currentUser = userData[0];
    }
  }
};
</script>

<style scoped>
.v-btn {
  margin-left: 0px;
  margin-right: 0px;
}

.v-card__title {
  padding: 18px 0px;
}
</style>