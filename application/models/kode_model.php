
<?php
class kode_model extends CI_Model{
 
    function get_no_nota(){
        $cd = $this->db->query("SELECT MAX(RIGHT(no_nota,4)) AS kd_max FROM t_nota WHERE DATE(tanggal)=CURDATE()");
        $kd = "";
        if($cd->num_rows()>0){
            foreach($cd->result() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = sprintf("%04s", $tmp);
            }
        }else{
            $kd = "0001";
        }
        date_default_timezone_set('Asia/Jakarta');
        return date('my')."-".$kd;
    }
 
    function simpan_nota($no_nota){
        $hasil=$this->db->query("INSERT INTO t_nota (no_nota) VALUES ('$no_nota')");
        return $hasil;
    }
 
}