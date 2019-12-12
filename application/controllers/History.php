<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_surat
class History extends REST_Controller{

    public function __construct($config = 'rest')
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

public function index_get(){
        $id = $this->get("id_user");

        $hasil = [];
        $surat = "";
        $penerima = "";
        $dari = "";
        $final = [];
    
        $this->db->where("penerima","25");
        $this->db->or_where("dari","25");
        $data = $this->db->get("tb_history_surat");

        $index =0;

        if($data->num_rows() >= 0){
            //berhasil simpan
            foreach($data->result_array() as $row){
                
                $this->db->where("id",$row['penerima']);
                $get_data_user = $this->db->get("tb_user");
                if($get_data_user->num_rows() >= 0){
                   
                   // var_dump($get_data_user->result_array());
                   //$penerima = $get_data_user->result_array();
                   foreach($get_data_user->result_array() as $p){
                    $penerima = $p['nama'];
                   }


                }
                $this->db->where("id",$row['id_surat']);
                $get_data_surat = $this->db->get("tb_surat");
                if($get_data_surat->num_rows() >= 0){
                   
                    //var_dump($get_data_surat->result_array());
                   // $surat = $get_data_surat->result_array();
                   foreach($get_data_surat->result_array() as $s){
                       $surat = $s['nomor_surat'];
                   }

                }
                $this->db->where("id",$row['dari']);
                $get_data_dari = $this->db->get("tb_user");
                if($get_data_dari->num_rows() >= 0){
                   
                    //var_dump($get_data_dari->result_array());
                   // $dari = $get_data_dari->result_array();
                   foreach($get_data_dari->result_array() as $d){
                       $dari = $d['nama'];
                   }

                }

                $has = array(
                    "surat" => $surat,
                    "penerima" => $penerima,
                    "dari" => $dari,
                   
                );
                array_push($hasil,$has);
            }
           
           // die();
            $this->response([
                'success' => true,
                'message' => 'Data Berhasil Terkirim',
                'data'    => $hasil
           ], 200);
        } else {
            //gagal simpan
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dikirim',
                'data'    => $data->result_array()
            ], 200);
        }
    }
}