<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_post
class DeleteArtikel extends REST_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}
    public function index_post()
	{
		$id     = $this->post('id');
		$gambar = $this->db->select('gambar');
		$gambar = $this->db->where('id', $id);
		$gambar = $this->db->get('tb_post')->row();
		
		if($gambar != null){
			//fungsi unlink untuk mengahpus file
			@unlink("uploads_artikel/" . $gambar->gambar);
		}
		$hapus = $this->db->where('id', $id);
		$hapus = $this->db->delete('tb_post');
		
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