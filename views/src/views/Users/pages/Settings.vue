<template>
  <div>
    <v-dialog v-model="dialog" persistent max-width="600">
      <v-card class="pa-2">
        <h2 class="px-4 py-4">Sunting hak akses</h2>
        <v-divider class="mb-5"></v-divider>
        <v-card-text>
          <v-form ref="form">
            <v-container grid-list-xl fluid>
              <v-layout wrap>
                <v-flex xs12 sm6>
                  <v-text-field v-model="nama" filled disabled label="Nama"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6>
                  <v-text-field v-model="nidn" filled disabled label="NIDN"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6>
                  <v-text-field v-model="email" filled disabled label="Email"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6>
                  <v-switch v-model="akses" @change="update" color="success" label="Hak akses"></v-switch>
                </v-flex>
                <!-- <v-text-field outlined v-model="kategori" label="Kategori"></v-text-field> -->
              </v-layout>
            </v-container>
          </v-form>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="primary" @click="dialog = false">Oke</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-container>
      <v-card-title>
       
        <v-spacer></v-spacer>
        <v-text-field v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
      </v-card-title>

      <v-data-table :headers="headers" :items="prodi" :search="search" class="elevation-1">
        <template v-slot:items="props">
          <td>{{ props.item.nama }}</td>
          <td class="text-xs-right">{{ props.item.nidn}}</td>
          <td class="text-xs-right">{{ props.item.email}}</td>
          <td class="text-xs-right">{{ props.item.kategori }}</td>
        </template>

        <template v-slot:item.status="{ item }">
        {{ item.hak_akses }}
        </template>

        <template v-slot:item.actions="{ item }">
          <v-btn
            fab
            small
            dark
            color="primary"
            @click.stop="updateConfirmation(item.id, item.nama, item.nidn, item.email, item.kategori, item.hak_akses), dialog = true"
          >
            <v-icon dark>edit</v-icon>
          </v-btn>
        </template>
      </v-data-table>
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
      { text: "Nidn", value: "nidn" },
      { text: "Email", value: "email" },
      {
        text: "Kategori",
        value: "kategori",
        filter: value => {
          return value === "Dosen";
        }
      },
      { text: "Status", value: "hak_akses" },
      { text: "Aksi", value: "actions" }
    ],
    prodi: [ ],
    dialog: false,
    akses: true,
    hak_akses : '',
    search: ""
  
  }),
  created() {
    this.getData();
  },
  methods: {
    update : function(){
      let ak = ""; 
      if(this.akses){
        ak = 'aktif'
      }else {
        ak = "tidak aktif"
      }
         let data = {
         id_user : this.id,
         status : ak
       };
      return this.axios.post("/hak_akses", data)
      .then(res =>{
        console.log(res.data)
        this.getData();
      }).catch((err)=>{

      });
    },
    getData: function() {
      this.axios
        .get("/user")
        .then(res => {
         let data= [] ;
       this.prodi = res.data.data;
       console.log(res.data)
          // for (var i = 0; i <= res.data.data.length; i ++){
          //    let user = res.data.data[i] ;
           
            
          //    data = {
          //       id : user .id,
          //       nama : user.nama,
          //       nidn : user.nidn,
          //       email : user.email,
          //       password : user.password,
          //       kategori : user.kategori,
          //       hak_akses : user.hak_akses,
          //   }
           
          // }
         // this.prodi = data;
         //  console.log(data);
        //  console.log(res.data.data);
        })
        .catch(err => {
        //  console.log(err);
        });
    },
    updateConfirmation(id, nama, nidn, email, kategori, hak_akses) {
      this.id = id;
      this.nama = nama;
      this.nidn = nidn;
      this.email = email;
      this.kategori = kategori;
      if(hak_akses == "aktif"){
        this.akses = true;
      }else{
        this.akses = false;
      }
      this.hak_akses = hak_akses;

    }
  }
};
</script>