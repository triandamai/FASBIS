<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Login extends REST_Controller{
    
    public function __construct()
    {
        parent::__construct();
    }

    public function index_get(){

    }
    //fungsi Get untuk mengambil data
    public function index_post()
    {
       $email = $this->post('email');
       $pass  = $this->post('password');
       $kategori = $this->post('kategori');
       $where = array (
           'email'=> $email, 'password' => md5($pass), //'kategori' => $kategori
        );
        
        // $where = array (
        //     'email'=> $email, 'password' => md5($pass), 'kategori' => $kategori
        //  );
       $this->db->where($where);
        //mengambil data dari database
        $data = $this->db->get('tb_user');

        if ($data->num_rows()>0){
            $data_user = $data->result();
            $id = $data_user[0]->id;
            $this->db->where('id_user',$id);
            $full_data = $this->db->get('tb_hak_akses');

            $data_auth[] = array(
                'id' => $data_user[0]->id,
                'nama' => $data_user[0]->nama,
                'email' => $data_user[0]->email,
                'password'=> $data_user[0]->password,
                'kategori' => $data_user[0]->kategori,
                'hak_akses' => $full_data->result()[0]->status
            );
            $this->response([
                'success' => true,
                'message' =>'API',
                //fungsi result sebagai wadah 
                'data'    => $data_auth
            ], 200);             
        } else {
            $this->response([
                'success' => false,
                'message' =>'Login Gagal',
                //fungsi result sebagai wadah
                'data'    => $data->result()
    
            ], 200);
        }

       
    }
}