<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_post
class Artikel extends REST_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}
	//fungsi Get untuk mengambil data
	public function index_get()
	{
		$kategori = $this->get('kategori');
		$id = $this->get('id');
		if($kategori == null || $kategori == ""){
			$data = $this->db->get('tb_post');
		}else {
		//mengambil data dari database
        $data = $this->db->where('kategori', $kategori);
		$data = $this->db->get('tb_post');
		}
		//"select * from tb_post"
		$this->response([
			'success' => true,
			'message' => 'Daftar Artikel',
			//fungsi result sebagai wadah
			'data'    => $data->result()
		], 200);
	}
															
	public function index_post()
	{
		//untuk bagian ini penamaan bebas
		$id_user 	  = $this->post("id_user");
		$judul        = $this->post("title_post");
		$isi_berita   = $this->post("body_post");
		$kategori 	  = $this->post("kategori");
		$img 		  = $this->post('image');
		$ext 		  = $this->post('ext');
		$ext_final = str_replace("image/","",$ext);
		$img = substr(explode(";",$img)[1], 7);
		$new_name = $kategori."_".date("d-m-Y")."_".time().".".$ext_final;
		file_put_contents($_SERVER['DOCUMENT_ROOT']."/kp_amikom/uploads_artikel/".$new_name, base64_decode($img));

		
			$data = array(	
				"id_user"    => $id_user,
				"title_post" => $judul,
				"body_post"  => $isi_berita,
				"date"       => date("Y-m-d"),
				"kategori"   => $kategori,
				"gambar"     => $new_name,
				"full_gambar"=> base_url()."uploads_artikel/".$new_name,
				"type_gambar" => $ext
						);
			//simpan ke database
			$simpan = $this->db->insert("tb_post",$data);
			
			if($simpan){
				//berhasil simpan
				$this->response([
					'success' => true,
					'message' => 'Data Berhasil Terkirim',
					'data' => '404'
				], 200);
			} else {
				//gagal simpan
				$this->response([
					'success' => false,
					'message' => 'Data Gagal Dikirim',
					'data'    => '404'
				], 200);
			}
		
	}
		


	
}