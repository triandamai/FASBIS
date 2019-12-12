<template>
  <div>
    <NavBar />
    <div class="container__p">
      <div class="container__p--inner">
        <h1>Kurikulum</h1>
        <v-app>
          <v-card-title>
            <v-text-field
              v-model="search"
              append-icon="search"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
          </v-card-title>
          <v-data-table :headers="headers" :items="kurikulum" :items-per-page="5" :search="search" class="elevation-1">
            <template v-slot:items="props">
              <td>{{ props.item.kode }}</td>
              <td class="text-xs-left">{{ props.item.matakuliah }}</td>
              <td class="text-xs-left">{{ props.item.sks }}</td>
              <td class="text-xs-left">{{ props.item.smt }}</td>
            </template>
          </v-data-table>
        </v-app>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import NavBar from "../../components/NavBar";
import Footer from "../../components/Footer";

export default {
  name: "Kurikulum",
  components: {
    NavBar,
    Footer
  },
  data() {
    return {
      search: "",
      headers: [
        {
          text: "Kode",
          align: "left",
          value: "kode"
        },
        {
          text: "Mata Kuliah",
          value: "matakuliah",
          sortable: false
        },
        {
          text: "SKS",
          value: "sks",
          sortable: false
        },
        { text: "Semester", value: "smt" }
      ],
      kurikulum: [
        {
          kode: "AP101",
          matakuliah: "Sikap Mental Amikom",
          sks: 2,
          smt: 1
        },
        {
          kode: "AP102",
          matakuliah: "Pendidikan Agama",
          sks: 3,
          smt: 1
        },
        {
          kode: "AP201",
          matakuliah: "Bahasa Indonesia",
          sks: 3,
          smt: 7
        },
        {
          kode: "AP202",
          matakuliah: "Pendidikan Pancasila dan Kewarganegaraan",
          sks: 3,
          smt: 1
        },
        {
          kode: "IF101",
          matakuliah: "Bahasa Inggris",
          sks: 2,
          smt: 3
        },
        {
          kode: "IF102",
          matakuliah: "Bahasa Inggris II",
          sks: 2,
          smt: 4
        },
        {
          kode: "IF103",
          matakuliah: "Kalkulus 1",
          sks: 3,
          smt: 1
        },
        {
          kode: "IF104",
          matakuliah: "kalkulus 2",
          sks: 3,
          smt: 2
        },
        {
          kode: "IF105",
          matakuliah: "Pemrograman Web",
          sks: 3,
          smt: 1
        },
        {
          kode: "IF06",
          matakuliah: "Algoritma dan Struktur Data",
          sks: 3,
          smt: 1
        },
        {
          kode: "IF107",
          matakuliah: "Arsitektur dan Organisasi Komputer",
          sks: 3,
          smt: 1
        },
        {
          kode: "IF108",
          matakuliah: "Sistem Basis Data",
          sks: 4,
          smt: 1
        },
        {
          kode: "IF109",
          matakuliah: "Pemrograman Berorientasi Objek",
          sks: 4,
          smt: 2
        },
        {
          kode: "IF110",
          matakuliah: "Statistik Probabilitas",
          sks: 3,
          smt: 2
        },
        {
          kode: "IF111",
          matakuliah: "Representasi dan Penalaran",
          sks: 3,
          smt: 2
        },
        {
          kode: "IF112",
          matakuliah: "Logika Digital dan Sistem Digital",
          sks: 3,
          smt: 2
        },
        {
          kode: "IF113",
          matakuliah: "Aljabar Linier",
          sks: 3,
          smt: 2
        },
        {
          kode: "IF114",
          matakuliah: "Matematima Diskret",
          sks: 4,
          smt: 2
        },
        {
          kode: "IF115",
          matakuliah: "Pembelajaran Mesin",
          sks: 4,
          smt: 3
        },
        {
          kode: "IF116",
          matakuliah: "Grafika Komputer",
          sks: 3,
          smt: 3
        },
        {
          kode: "IF117",
          matakuliah: "Sistem Operasi",
          sks: 3,
          smt: 3
        },
        {
          kode: "IF118",
          matakuliah: "Pemrograman .NET",
          sks: 3,
          smt: 3
        },
        {
          kode: "IF119",
          matakuliah: "Mikroprosesor",
          sks: 3,
          smt: 3
        },
        {
          kode: "IF120",
          matakuliah: "Jaringan Komputer",
          sks: 3,
          smt: 3
        },
        {
          kode: "IF121",
          matakuliah: "Pendidikan Anti Korupsi",
          sks: 2,
          smt: 3
        },
        {
          kode: "IF122",
          matakuliah: "Bahasa Assembly",
          sks: 3,
          smt: 4
        },
        {
          kode: "IF123",
          matakuliah: "Kriptografi",
          sks: 2,
          smt: 4
        },
        {
          kode: "IF124",
          matakuliah: "Sistem Terdistribusi",
          sks: 3,
          smt: 4
        },
        {
          kode: "IF125",
          matakuliah: "Rekayasa Perangkat Lunak",
          sks: 2,
          smt: 4
        },
        {
          kode: "IF126",
          matakuliah: "Pemrograman Logik dan Semantik",
          sks: 3,
          smt: 4
        },
        {
          kode: "IF127",
          matakuliah: "Multimedia",
          sks: 3,
          smt: 4
        },
        {
          kode: "IF128",
          matakuliah: "Interaksi Manusia dan Komputer",
          sks: 2,
          smt: 5
        },
        {
          kode: "IF129",
          matakuliah: "Pengolah Citra Digital",
          sks: 3,
          smt: 5
        },
        {
          kode: "IF130",
          matakuliah: "Metode Pengembangan Perangkat Lunak",
          sks: 3,
          smt: 5
        },
        {
          kode: "IF131",
          matakuliah: "Cloud Computing",
          sks: 2,
          smt: 5
        },
        {
          kode: "IF132",
          matakuliah: "Teori Graf",
          sks: 3,
          smt: 5
        },
        {
          kode: "IF133",
          matakuliah: "Keamanan Informasi dan Jaringan",
          sks: 3,
          smt: 5
        },
        {
          kode: "IF134",
          matakuliah: "Teori Otomata",
          sks: 3,
          smt: 6
        },
        {
          kode: "IF135",
          matakuliah: "Metode Penelitian",
          sks: 3,
          smt: 6
        },
        {
          kode: "IF136",
          matakuliah: "Temu Balik Informasi",
          sks: 3,
          smt: 6
        },
        {
          kode: "IF137",
          matakuliah: "Tugas Praktik",
          sks: 3,
          smt: 6
        },
        {
          kode: "IF138",
          matakuliah: "Pengenalan Sistem Informasi",
          sks: 2,
          smt: 6
        },
        {
          kode: "IF139",
          matakuliah: "Isu Sosial dan Etika Profesi",
          sks: 2,
          smt: 6
        },
        {
          kode: "IF140",
          matakuliah: "Techopreneur",
          sks: 2,
          smt: 7
        },
        {
          kode: "IF141",
          matakuliah: "Digital Forensic",
          sks: 3,
          smt: 7
        },
        {
          kode: "IF142",
          matakuliah: "Pemrograman Mobile 1",
          sks: 4,
          smt: 4
        },
        {
          kode: "IF143",
          matakuliah: "Pemrosesan Bahasa Alami",
          sks: 4,
          smt: 4
        },
        {
          kode: "IF144",
          matakuliah: "Visualisasi 2D",
          sks: 4,
          smt: 4
        },
        {
          kode: "IF145",
          matakuliah: "Pemrograman Mobile 2",
          sks: 4,
          smt: 5
        },
        {
          kode: "IF146",
          matakuliah: "Agent",
          sks: 4,
          smt: 5
        },
        {
          kode: "IF147",
          matakuliah: "Visualisasi 3D",
          sks: 4,
          smt: 5
        },
        {
          kode: "IF148",
          matakuliah: "Pemrograman Game Mobile",
          sks: 4,
          smt: 6
        },
        {
          kode: "IF149",
          matakuliah: "Visi Komputer",
          sks: 4,
          smt: 6
        },
        {
          kode: "IF150",
          matakuliah: "Animasi Komputer",
          sks: 4,
          smt: 6
        },
        {
          kode: "IF151",
          matakuliah: "Skripsi",
          sks: 8,
          smt: 6
        },
        {
          kode: "ST052",
          matakuliah: "Tugas Praktik",
          sks: 2,
          smt: 7
        },
        {
          kode: "ST053",
          matakuliah: "Visualisasi 3D",
          sks: 6,
          smt: 7
        }
      ]
    };
  },
  metaInfo: {
    title:
      "Kurikulum | Prodi Teknik Informatika - Universitas Amikom Purwokerto"
  }
};
</script>

<style scoped>
.application--wrap {
  min-height: 0vh !important;
}
</style>
