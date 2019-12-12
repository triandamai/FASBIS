<template>
  <div>
    <!-- <v-toolbar dense flat dark color="purple darken-4">
  
      <v-toolbar-items>
        <v-btn text to="/dashboard/list_users">Kirim semua</v-btn>
        <v-btn text to="/dashboard/list_users/all">Kirim satu persatu</v-btn>
      </v-toolbar-items>

    </v-toolbar>-->
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
          <v-btn class="ma-2" dark color="primary" @click="kirimConfirmBanyak">
            <v-icon left>mdi-mail</v-icon>Kirim surat Ke Banyak
          </v-btn>

          <v-btn dark color="blue-grey darken-3" @click="dialogAdd = true">
            <v-icon left>add</v-icon>Tambah Dosen
          </v-btn>
          <v-spacer></v-spacer>
          <v-text-field
            v-model="search"
            append-icon="search"
            label="Search"
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>

        <!-- item-key="name"
        show-select-->
        <v-data-table
          v-model="selected"
          :headers="headers"
          :items="dosen"
          item-key="id"
          show-select
          single-select
          :search="search"
          class="elevation-1"
        >
          <template v-slot:item.data-table-select="{ item }">
            <v-checkbox
              color="green"
              v-model="item.selected"
              @change="coba(item.id, item.nama, item.nidn, item.email)"
            ></v-checkbox>
          </template>

          <template v-slot:item.action="{ item }">
            <v-btn class="ma-2" dark color="primary" @click="kirimConfirm(item.id, item.nama)">
              <v-icon left>mdi-mail</v-icon>Kirim surat
            </v-btn>
            <v-btn
              class="ma-2"
              outlined
              color="success"
              @click="updateConfirmation(item.id, item.nama, item.nidn, item.email, item.kategori), dialogUpdate= true"
            >
              <v-icon left>mdi-pencil</v-icon>Edit
            </v-btn>
            <v-btn class="ma-2" dark color="error" @click="deleteConfirm(item.id, item.nama)">
              <v-icon left>mdi-delete</v-icon>Hapus
            </v-btn>
          </template>
        </v-data-table>

        <v-dialog v-model="dialogAdd" persistent max-width="600px">
          <v-card class="pa-5">
            <h2 class="mb-5">Tambah user</h2>
            <v-divider class="mb-5"></v-divider>
            <v-card-text>
              <v-form ref="form" v-model="valid" :lazy-validation="lazy">
                <v-text-field outlined v-model="nama" :rules="namaRules" label="Nama"></v-text-field>
                <v-text-field outlined v-model="email" :rules="emailRules" label="Email"></v-text-field>
                <v-text-field outlined v-model="nidn" :rules="nidnRules" label="NIDN" counter="10"></v-text-field>
                <v-text-field
                  outlined
                  v-model="password"
                  :append-icon="show ? 'visibility' : 'visibility_off'"
                  :rules="passwordRules"
                  :type="show ? 'text' : 'password'"
                  @click:append="show = !show"
                  label="Password"
                ></v-text-field>

                <v-file-input
                  outlined
                  accept="image/png, image/jpeg, image/bmp"
                  placeholder="Pilih gambar..."
                  prepend-inner-icon="mdi-camera"
                  label="Gambar dosen"
                  ref="files"
                  type="file"
                  @change="onFilePicked"
                ></v-file-input>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="reset">Batal</v-btn>
              <v-btn color="primary" :disabled="!valid" @click="saveData">Simpan</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <v-dialog v-model="dialogUpdate" persistent max-width="600px">
          <v-card class="pa-5">
            <h2 class="mb-5">Sunting user</h2>
            <v-divider class="mb-5"></v-divider>
            <v-card-text>
              <v-form ref="form">
                <v-text-field outlined v-model="nama" :rules="namaRules" label="Nama"></v-text-field>
                <v-text-field outlined v-model="nidn" :rules="nidnRules" label="NIDN"></v-text-field>
                <v-text-field outlined v-model="email" :rules="emailRules" :label="Email"></v-text-field>
                <v-file-input
                  outlined
                  accept="image/png, image/jpeg, image/bmp"
                  placeholder="Pilih gambar..."
                  prepend-inner-icon="mdi-camera"
                  label="Gambar dosen"
                  ref="files"
                  type="file"
                  @change="onFilePicked"
                ></v-file-input>
                <!-- <v-text-field outlined v-model="kategori" label="Kategori"></v-text-field> -->
              </v-form>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="reset">Batal</v-btn>

              <v-btn color="primary" @click="updateData">Simpan</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <v-dialog v-model="dialogConfirm" persistent max-width="500px">
          <v-divider></v-divider>
          <v-card class="pa-5">
            <v-card-text>
              <h1 style="line-height:1.5">Apakah kamu yakin ingin menghapus artikel ini?</h1>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="dialogConfirm = false">Batal</v-btn>

              <v-btn color="error" @click="deleteData(id), dialogConfirm= false">Oke</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <!-- kirim surat dialog -->
        <v-dialog v-model="dialogSurat" persistent max-width="600px">
          <v-divider></v-divider>
          <v-card class="pa-5">
            <v-card-text>
              <h2 class="mb-5">
                Mengirim surat ke
                <span class="purple--text font-weight-bold">{{ nama }}?</span>
              </h2>
              <v-divider class="mb-5"></v-divider>
              <v-form ref="form">
                <v-text-field outlined v-model="judul_surat" label="Judul surat"></v-text-field>
                <!-- <v-text-field outlined v-model="urutan_surat" label="No Urut Surat"></v-text-field> -->
                <v-select
                  outlined
                  v-model="jenis_surat"
                  :rules="[v => !!v || 'This is required']"
                  :items="tipe_items"
                  label="Surat dari.."
                  item-text="name"
                  item-value="value"
                  required
                ></v-select>
                <v-select
                  outlined
                  v-model="perihal"
                  :rules="[v => !!v || 'This is required']"
                  :items="tipe_perihal"
                  label="Perihal.."
                  item-text="name"
                  item-value="value"
                  required
                ></v-select>
                <v-file-input
                  v-model="file_surat"
                  outlined
                  accept="application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                  @change="onFilePicked"
                  ref="files"
                  type="file"
                  placeholder="Unggah file disini.."
                  prepend-icon="mdi-paperclip"
                >
                  <!-- <template v-slot:selection="{ text }">
                  <v-chip small label color="primary">{{ text }}</v-chip>
                  </template>-->
                </v-file-input>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="reset">Batal</v-btn>
              <v-btn color="primary" @click="sendOneData">Kirim surat</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <v-dialog v-model="dialogSuratBanyak" persistent max-width="600px">
          <v-divider></v-divider>
          <v-card class="pa-5">
            <v-card-text>
              <h2 class="mb-5">
                Mengirim surat ke
                <span class="purple--text font-weight-bold">{{ nama }}?</span>
              </h2>
              <v-divider class="mb-5"></v-divider>
              <v-form ref="form">
                <v-text-field outlined v-model="judul_surat" label="Judul surat"></v-text-field>
                <!-- <v-text-field outlined v-model="urutan_surat" label="No Urut Surat"></v-text-field> -->
                <v-select
                  outlined
                  v-model="jenis_surat"
                  :rules="[v => !!v || 'This is required']"
                  :items="tipe_items"
                  label="Surat dari.."
                  item-text="name"
                  item-value="value"
                  required
                ></v-select>
                <v-select
                  outlined
                  v-model="perihal"
                  :rules="[v => !!v || 'This is required']"
                  :items="tipe_perihal"
                  label="Perihal.."
                  item-text="name"
                  item-value="value"
                  required
                ></v-select>
                <v-file-input
                  v-model="file_surat"
                  outlined
                  accept="application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                  @change="onFilePicked"
                  ref="files"
                  type="file"
                  placeholder="Unggah file disini.."
                  prepend-icon="mdi-paperclip"
                >
                  <!-- <template v-slot:selection="{ text }">
                  <v-chip small label color="primary">{{ text }}</v-chip>
                  </template>-->
                </v-file-input>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="reset">Batal</v-btn>
              <v-btn color="primary" @click="sendData">Kirim surat</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <!-- dialog buat kalau emailnya sama -->
        <v-dialog v-model="dialogEmail" max-width="500">
          <v-card class="pa-5">
            <v-card-text>
              <h2 style="line-height:1.5">Email yang Anda masukkan sudah teregistrasi...</h2>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialogEmail = false">Oke</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
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
        value: "nama"
      },
      { text: "Nidn", value: "nidn", sortable: false },
      { text: "Email", value: "email", sortable: false },
      {
        text: "Kategori",
        value: "kategori",
        sortable: false,
        filter: value => {
          return value === "Dosen";
        }
      },
      { text: "Action", value: "action", sortable: false }
    ],
    // tipe_items: [
    //   { name: "SK Penguji", value: "SK Penguji" },
    //   { name: "SK Mengajar", value: "SK Mengajar" },
    //   { name: "SK Dosen Pembimbing", value: "SK Dosen Pembimbing" }
    // ],
    tipe_items: [
      { name: "External", value: "P" },
      {
        name: "Internal",
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
    show: false,
    valid: true,
    lazy: false,
    passwordRules: [
      v => !!v || "Password harus diisi",
      v => v.length > 5 || "Password harus lebih dari 6 karakter"
    ],
    emailRules: [
      v => !!v || "E-mail harus diisi",
      v => /.+@.+/.test(v) || "E-mail harus valid",
      v =>
        /^[A-Za-z0-9._%=-]+@amikompurwokerto.ac.id$/.test(v) ||
        "Gunakan email amikompurwokerto.ac.id"
    ],
    nidnRules: [
      v => !!v || "Nidn harus diisi",
      v => v.length < 11 || "Nidn tidak boleh lebih dari 10 karakter",
      v => /^\d+$/.test(v) || "Nidn harus angka"
    ],
    namaRules: [
      v => !!v || "Nama harus diisi",
      v => /^[A-Za-z\s]*$/.test(v) || "Nama tidak boleh mengandung angka"
    ],
    emailValid: "",
    search: "",
    tipe_surat: null,
    dialogAdd: false,
    dialogConfirm: false,
    dialogUpdate: false,
    dialogSurat: false,
    dialogEmail: false,
    dialogSuratBanyak: false,
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
    Email: "",
    id_pengirim: ""
  }),
  created() {
    this.getData();
    this.getCurrentUser();
  },
  methods: {
    multiple: function() {
      // console.log();
    },
    getData: function() {
      this.axios
        .get("/user")
        .then(res => {
          this.dosen = res.data.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getCurrentUser: function() {
      let userData = JSON.parse(localStorage.getItem("user"));
      this.currentUser = userData[0];
    },
    reset() {
      this.$refs.form.reset();
      this.dialogAdd = false;
      this.dialogUpdate = false;
      this.dialogSurat = false;
      this.dialogConfirm = false;
      this.dialogSuratBanyak = false;
    },
    saveData() {
      let data = {
        nama: this.nama,
        nidn: this.nidn,
        email: this.email,
        password: this.password,
        kategori: this.kategori,
        foto: this.suratFile,
        ext: this.suratType
      };
      this.axios
        .post("/user", data)
        .then(res => {
          // console.log(res);

          this.reset();
          this.getData();

          if (res.data.message === "Email Sudah ada") {
            this.dialogEmail = true;
            this.reset();
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    updateData() {
      let data = {
        id: this.id,
        nama: this.nama,
        nidn: this.nidn,
        email: this.email,
        //  password: this.password,
        kategori: this.kategori,
        foto: this.suratFile,
        ext: this.suratType
      };
      this.axios
        .put("/user", data)
        .then(res => {
          this.dialogUpdate = false;
          this.getData();
          this.$refs.form.reset();
        })
        .catch(err => {
          console.log(err);
        });
    },
    deleteData(ida) {
      let data = {
        id: ida
      };
      this.axios
        .post("/hapususer", data)
        .then(res => {
          this.dialogConfirm = false;
          this.snackbarDelete = true;
          this.getData();
          this.$refs.form.reset();
        })
        .catch(err => {
          console.log(err);
        });
    },
    checkTipe(value) {
      this.jenis_surat = value;
    },
    sendData() {
      let data_surat = {
        urutan: this.urutan_surat,
        judul_surat: this.judul_surat,
        jenis_surat: this.jenis_surat,
        id_user: this.selected,
        id_pengirim: this.currentUser.id,
        file_surat: this.suratFile,
        ext: this.suratType,
        perihal: this.perihal
      };

      this.axios
        .post("/surat/multi", data_surat)
        .then(res => {
          this.dialogSuratBanyak = false;
          this.snackbar = true;
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        });
    },
    sendOneData() {
      let data_surat = {
        urutan: this.urutan_surat,
        judul_surat: this.judul_surat,
        jenis_surat: this.jenis_surat,
        id_user: this.id,
        id_pengirim: this.currentUser.id,
        file_surat: this.suratFile,
        ext: this.suratType,
        perihal: this.perihal
      };

      this.axios
        .post("/surat", data_surat)
        .then(res => {
          this.dialogSurat = false;
          this.snackbar = true;
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        });
    },
    deleteConfirm(id) {
      this.id = id;
      this.dialogConfirm = true;
    },
    kirimConfirm(id, nama) {
      this.id = id;
      this.nama = nama;
      this.dialogSurat = true;
    },
    kirimConfirmBanyak(id, nama) {
      this.id = id;
      this.nama = nama;
      this.dialogSuratBanyak = true;
    },
    updateConfirmation(id, nama, nidn, email, kategori) {
      this.id = id;
      this.nama = nama;
      this.nidn = nidn;
      this.email = email;
      this.kategori = kategori;
    },
    onFilePicked(e) {
      const fr = new FileReader();
      fr.readAsDataURL(e);
      fr.addEventListener("load", () => {
        this.suratURL = e;
        this.suratFile = fr.result; // this is an image file that can be sent to server...
        if (
          e.type ===
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        ) {
          this.suratType = "application/docx";
        } else if (e.type === "application/msword") {
          this.suratType = "application/doc";
        } else if (e.type === "application/pdf") {
          this.suratType = e.type;
        } else {
          this.suratType = e.type;
        }
        //console.log(fr.result);
        //console.log(e.type);
      });
    },
    validateEmail(v) {
      var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (re.test(this.email)) {
        //Email valid. Procees to test if it's from the right domain (Second argument is to check that the string ENDS with this domain, and that it doesn't just contain it)
        if (
          this.email.indexOf(
            "@amikompurwokerto.ac.id",
            this.email.length - "@amikompurwokerto.ac.id".length
          ) !== -1
        ) {
          //VALID
          return (this.emailValid = null);
          console.log("VALID");
        } else {
          console.log("invalid");
          return (this.emailValid = "Gunakan Email Amikompurwokerto.ac.id");
        }
      }
    },
    coba(id, nama, nidn, email) {
      this.id = id;
      this.nama = nama;
      this.nidn = nidn;
      this.email = email;

      let obj = {
        id: this.id
        // nama: this.nama,
        // nidn: this.nidn,
        // email:this.nidn
      };
      // var arr = [];
      // arr.push(id);
      this.selected.push(obj);
      /*
      selected: [{},{}]
      */
      console.log(this.selected);
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