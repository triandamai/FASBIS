<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_post
class ArtikelFull extends REST_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}
	//fungsi Get untuk mengambil data
	public function index_get()
	{
		//ambil per id
		$id = $this->get('id');
		if($id == null || $id == ""){
			$this->response([
				'success' => false,
				'message' => 'Operasi tidak didukung',
				//fungsi result sebagai wadah
				'data'    => ""
			], 200);
		}else {
			//mengambil data dari database
			$data = $this->db->where('id', $id);
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
}