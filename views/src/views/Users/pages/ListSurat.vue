<template>
  <div>
    <v-container>
      <v-card-title>
        <span class="font-weight-bold">Daftar surat</span>
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="search"
          label="Search"
          :search="search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="items"
        :search="search"
        :items-per-page="10"
        class="elevation-1"
      >
        <template v-slot:item.action="{ item }">
          <v-btn v-bind:href="item.file_surat" class="ma-2" outlined color="success">
            <v-icon left>file_download</v-icon>Download
          </v-btn>
          <!-- <v-btn class="ma-2" dark color="error"
            @click="deleteConfirm(item.id)">
              <v-icon left>mdi-delete</v-icon> Hapus
          </v-btn>-->
        </template>
      </v-data-table>
    </v-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      headers: [
        {
          text: "Tanggal dikirim oleh kaprodi",
          value: "tanggal"
        },
        {
          text: "Nomor",
          value: "nomor_surat"
        },
        {
          text: "Judul surat",
          align: "left",
          sortable: false,
          value: "judul_surat"
        },
        { text: "Tipe surat", value: "jenis_surat" },
        { text: "Action", value: "action" }
      ],
      items: [],
      currentUser: ""
    };
  },
  mounted() {
    this.getDataUser();
    this.getData();
  },
  methods: {
    getData: function() {
      this.axios
        .get("/surat?id=" + this.currentUser.id)
        .then(res => {
          this.items = res.data.data;
          console.log(res.data.data);
        })
        .catch(err => {
          console.log(err);
        });
    },
    getDataUser: function() {
      let data = JSON.parse(localStorage.getItem("user"));
      this.currentUser = data[0];
    }
  }
};
</script>