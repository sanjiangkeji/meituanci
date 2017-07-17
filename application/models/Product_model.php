<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: cxy
 * Date: 2017/7/14
 * Time: 9:26
 */
class Product_model extends CI_Model
{
    public function get_product()
    {
        /*$query=$this->db->get('t_product');
        return $query->result();*/
        $sql="select t_product.*,(select sum(num) num from t_order where t_order.product_id=t_product.product_id) num from t_product";
        $query=$this->db->query($sql);
        return $query->result();
    }
    public function get_product_by_id($product_id){
        /*$query = $this->db->get_where('t_product',array('product_id'=>$product_id));
        return $query->row();*/
        $this->db->select('pro.*,bus.*,sum(order.num) num');
        $this->db->from('t_product pro');
        $this->db->join('t_business bus', 'bus.business_id = pro.business_id');
        $this->db->join('t_order order', 'order.product_id = pro.product_id');
        $this->db->where('pro.product_id',$product_id);
        $query = $this->db->get();
        return $query->row();
    }

    public function add_collect($user_id,$product_id){
        $data = array(
            'user_id' => $user_id,
            'product_id' => $product_id
        );
        $this->db->insert('t_collect', $data);
        return $this->db->affected_rows();
    }

    public function get_collect($user_id,$product_id){
        $query=$this->db->get_where('t_collect',array('user_id'=>$user_id,'product_id'=>$product_id,'is_delete'=>0));
        return $query->row();
    }
}