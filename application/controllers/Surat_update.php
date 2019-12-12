<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//class surat_update mengambil dari nama folder
class Surat_Update extends REST_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}
															
	public function index_post()
	{
		//untuk bagian ini penamaan bebas
		$id 		      = $this->post("id");
		$judul_surat      = $this->post("judul_surat");
		$jenis            = $this->post("jenis");
        $deskripsi        = $this->post("deskripsi");
        //$tanggal        = $this->post("tanggal");
		//$lampiran 	      = $this->post("lampiran");

		//mengambil nama file yang di upload
		$file_name   = $_FILES['lampiran']['name'];
		//merubah nama file yang diupload menjadi :
		$new_name = $jenis."_".date("d-m-Y")."_".time().".".pathinfo($file_name, PATHINFO_EXTENSION);
		//konfigurasi library upload
		//lokasi tempat gambar akan disimpan
		$config['upload_path']   = './uploads_surat/';
		//file apa saja yang boleh disimpan/jenis
		$config['allowed_types'] = 'pdf|doc|docx';
		//maksimal ukuran file 10Mb
		$config['max_size']      = 10000;
		//file/gambar yang disimpan akan di rename menjadi :
		$config['file_name'] = $new_name;
		//inisiasi library upload
		$this->load->library('Upload', $config);
	
		//untuk refresh dokumen surat yang baru
		$surat = $this->db->select('lampiran');
		$surat = $this->db->where('id', $id);
		$surat = $this->db->get('tb_surat')->row();

		if($surat !=null) {
			unlink("uploads_surat/" . $surat->lampiran);
		}

		//proses upload
		if ( ! $this->upload->do_upload('lampiran')) {
			//jika gagal
			$error = array('error' => $this->upload->display_errors());
			$this->response([
				'success' => false,
				'message' => $error,
				'data'    => '404'
			], 200);
		} else {
			//jika berhasil
			$data = array(	
				"id"         => $id,
				"judul_surat"=> $judul_surat,
				"jenis"      => $jenis,
				"deskripsi"  => $deskripsi,
				"tanggal"    => date("Y-m-d"),
				"lampiran"   => $new_name,
				"full_surat" => base_url().'uploads_surat/'.$new_name
       
			);
			//simpan ke database
			$this->db->where('id', $id);
			$simpan = $this->db->update("tb_surat",$data);
			
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
					'data' => '404'
				], 200);
			}
		}
	}
}