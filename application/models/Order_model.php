<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: cxy
 * Date: 2017/7/13
 * Time: 12:57
 */
class Order_model extends CI_Model
{
    public function get_order_by_user_id($user_id){
        $sql = "select order_id,product_name,price,num,order_price, num*order_price as total from t_order, t_product where t_order.product_id=t_product.product_id and t_order.user_id=".$user_id;
        return $this->db->query($sql)->result();
    }
    public function get_count_by_product_id($product_id)
    {
        /*$sql="select sum(num) num from t_order where product_id=$product_id";
        $query=$this->db->query($sql);
        return $query->row();*/
    }
}