<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Comment_model extends CI_Model
{
    public function get_comment($product_id){
        $this->db->select('tc.*,tu.username username');
        $this->db->from('t_comment tc');
        $this->db->join('t_user tu', 'tu.user_id = tc.user_id');
        //$this->db->join('t_t_comment_img tci', 'tc.id = tci.comment_id');
        $this->db->where('tc.product_id',$product_id);
        $query = $this->db->get();
        return $query->result();
    }
}