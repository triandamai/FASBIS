<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_surat
class Surat extends REST_Controller{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    //fungsi Get untuk mengambil data
    public function index_get()
    {
        //mengambil data dari database
        $id= $this->get('id');
        if($id == null || $id == ''){
            $data = $this->db->get('tb_surat');
        }else{
        $data = $this->db->where('id_user', $id);
        $data = $this->db->get('tb_surat');
        }
       
        //select * from tb_kaprodi
        $this->response([
            'success' => true,
            'message' => 'Daftar Download Surat',
            //fungsi result sebagai wadah
            'data'    => $data->result()
        ], 200);
    }

    public function index_post()
    {

        $bulan = date("m");
        $romawi = "";
        if($bulan ===  "01" ||$bulan === "1"){
            $romawi = "I";
        }elseif($bulan === "02" ||$bulan === "2"){
            $romawi = "II";
        }elseif($bulan === "03" ||$bulan === "3"){
            $romawi = "III";
        }elseif($bulan === "04" ||$bulan === "4"){
            $romawi = "IV";
        }elseif($bulan === "05" ||$bulan === "5" ){
            $romawi = "V";
        }elseif($bulan === "06" ||$bulan === "6" ){
            $romawi = "VI";
        }elseif($bulan === "07" ||$bulan === "7"){
            $romawi = "VII";
        }elseif($bulan === "08" ||$bulan === "8" ){
            $romawi = "VIII";
        }elseif($bulan === "09" ||$bulan === "9" ){
            $romawi = "IX";
        }elseif($bulan === "10" ||$bulan === "010"){
            $romawi = "X";
        }elseif($bulan === "11" ||$bulan === "011"){
            $romawi = "XI";
        }elseif($bulan === "12" ||$bulan === "012"){
            $romawi = "XII";
        }else{
            $romawi = "UNKNOWN";
        }
        
     
        //untuk bagian ini penamaan bebas
        $urut_surat    = $this->post("urutan");
        $perihal    = $this->post("perihal");
        $judul_surat    = $this->post("judul_surat");
        $jenis_surat    = $this->post("jenis_surat");
        $file_surat     = $this->post("file_surat");
        $id_user        = $this->post("id_user");
        $ext            = $this->post("ext");
        $id_pengirim = $this->post("id_pengirim");
        /*
            Surat Pengantar Fakultas Bisnis dan Ilmu Sosial
            Nomor : 001/AMIKOM PWT/FASBIS/03/IX/2019
            Surat Undangan Dari Rektor
            Nomor : 001/AMIKOM PWT/P/05/IX/2019
                    1       2     3  4  5   6
                    
                    1 = Nomor Urut Surat Keluar
                    2 = Kode Institusi
                    3 = Kode Perihal
                    4 = Kode Bulan Pembuatan
                    5 = Kode Tahun Pembuatan
            
        */
        //get last row
        $query = $this->db->get('tb_surat');
        $urutan_surat = $query->num_rows();
        
        if($urutan_surat == 0){
            $urut_surat = 1;
        }else {
            $urut_surat = $urutan_surat+1;
        }
        $kode = sprintf("%03d", $urut_surat);
 
		$ext_final = str_replace("application/","",$ext);
		$file_surat = substr(explode(";",$file_surat)[1], 7);
        $new_name = $jenis_surat."_".date("d-m-Y")."_".time().".".$ext_final;
        $kode_surat = $kode."/AMIKOM PWT/".$jenis_surat."/".$perihal."/".$romawi."/20".date("y");
		file_put_contents($_SERVER['DOCUMENT_ROOT']."/kp_amikom/uploads_surat/".$new_name, base64_decode($file_surat));
            //jika berhasil
            $data = array(
                "id" => $kode_surat,
                "nomor_surat" => $kode_surat,
                "judul_surat"   => $judul_surat,   
                "jenis_surat"   => $jenis_surat,
                "tanggal"       => date("Y-m-d"),
                "file_surat"    => base_url().'uploads_surat/'.$new_name,
                "isi_surat"     => $new_name,
                "id_user"       => $id_user
            );
            //simpan ke database
            $simpan = $this->db->insert("tb_surat",$data);

            if($simpan){
                //berhasil simpan
                $data = array(
                    "id_surat" => $kode_surat,
                    "penerima" => $id_user,
                    "dari" => $id_pengirim,

                );
                $add_history = $this->db->insert("tb_history_surat",$data);
                if($add_history){
                    $this->response([
                        'success' => true,
                        'message' => 'Data Berhasil Terkirim',
                        'data'    => '404'
                    ], 200);
                }else{
                    $this->response([
                        'success' => false,
                        'message' => 'Gagal',
                        'data'    => '404'
                    ], 200);
                }
                
            } else {
                //gagal simpan
                $this->response([
                    'success' => false,
                    'message' => 'Data Gagal Dikirim',
                    'data'    => '404'
                ], 200);
            }
        
    }
    
    public function multiple_post(){
        $bulan = date("m");
        $romawi = "";
        if($bulan ===  "01" ||$bulan === "1"){
            $romawi = "I";
        }elseif($bulan === "02" ||$bulan === "2"){
            $romawi = "II";
        }elseif($bulan === "03" ||$bulan === "3"){
            $romawi = "III";
        }elseif($bulan === "04" ||$bulan === "4"){
            $romawi = "IV";
        }elseif($bulan === "05" ||$bulan === "5" ){
            $romawi = "V";
        }elseif($bulan === "06" ||$bulan === "6" ){
            $romawi = "VI";
        }elseif($bulan === "07" ||$bulan === "7"){
            $romawi = "VII";
        }elseif($bulan === "08" ||$bulan === "8" ){
            $romawi = "VIII";
        }elseif($bulan === "09" ||$bulan === "9" ){
            $romawi = "IX";
        }elseif($bulan === "10" ||$bulan === "010"){
            $romawi = "X";
        }elseif($bulan === "11" ||$bulan === "011"){
            $romawi = "XI";
        }elseif($bulan === "12" ||$bulan === "012"){
            $romawi = "XII";
        }else{
            $romawi = "UNKNOWN";
        }
 
        $data = null;
        $urut_surat    = $this->post("urutan");
        $perihal    = $this->post("perihal");
        $judul_surat    = $this->post("judul_surat");
        $jenis_surat    = $this->post("jenis_surat");
        $file_surat     = $this->post("file_surat");
        $ext            = $this->post("ext");
        $data_idUser    = $this->post("id_user");
        $id_pengirim = $this->post("id_pengirim");
        //Semisal data user
        // $data_idUser = array(
        //     1,2,3,4,5
        // );

        // $judul_surat = "test judul";
        // $jenis_surat = "test jenis";
        //get last row
        $query = $this->db->get('tb_surat');
        $urutan_surat = $query->num_rows();
        
        if($urutan_surat == 0){
            $urut_surat = 1;
        }else {
            $urut_surat = $urutan_surat+1;
        }
        $kode = sprintf("%03d", $urut_surat);

		$ext_final = str_replace("application/","",$ext);
		$file_surat = substr(explode(";",$file_surat)[1], 7);
        $new_name = $jenis_surat."_".date("d-m-Y")."_".time().".".$ext_final;
        
        $kode_surat = $kode."/AMIKOM PWT/".$jenis_surat."/".$perihal."/".$romawi."/20".date("y");
		file_put_contents($_SERVER['DOCUMENT_ROOT']."/kp_amikom/uploads_surat/".$new_name, base64_decode($file_surat));
        $i=0;

        $data = array(
            "id"=>  $kode_surat,
            "nomor_surat" => $kode_surat,
            "judul_surat"   => $judul_surat,   
            "jenis_surat"   => $jenis_surat,
            "tanggal"       => date("Y-m-d"),
            "file_surat"    => base_url().'uploads_surat/'.$new_name,
            "isi_surat"     => $new_name,
            "id_user" => "kosong"
        );
        $add = $this->db->insert("tb_surat",$data);
        if($add){
            foreach($data_idUser as $key => $val){
                $data2[$i] = array(
                    "id_surat"=>  $kode_surat,
                    "dari"=>$id_pengirim,
                    "penerima" => $val['id']
                );
                $i++;
            }
            // $this->response([
            //     "data" => $data
            // ],200);
            // die(json_encode($data));
            $simpan = $this->db->insert_batch('tb_history_surat',$data2);   
            if($simpan){
                //berhasil simpan
                $this->response([
                    'success' => true,
                    'message' => 'Data Berhasil Terkirim',
                    'data'    => '404'
                ], 200);
            } else {
                //gagal simpan
                $this->response([
                    'success' => false,
                    'message' => 'Data Gagal Dikirim',
                    'data'    => '404'
                ], 200);
            }
        }else {
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dikirim',
                'data'    => '404'
            ], 200);
        }
 
    }

   
    public function index_delete()
    {
        $id    = $this->delete('id');
        $surat = $this->db->select('isi_surat');
        $surat = $this->db->where('id', $id);
        $surat = $this->db->get('tb_surat')->row();

        // $this->db->where('id', $id);
        // $hapus = $this->db->delete('tb_surat');
        if($surat != null){
            //fungsi unlink utntuk menghapus file
            unlink("uploads_Surat/" . $surat->isi_surat);
        }
        $hapus = $this->db->where('id', $id);
        $hapus = $this->db->delete('tb_surat');

        if($hapus){
            $this->response([
                'success' => true,
                'message' => 'Data Berhasil Terhapus',
                'data'    => $id
            ], 200);
        } else {
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dihapus',
                'data'    => '404'
            ], 200);
        }
    }
}