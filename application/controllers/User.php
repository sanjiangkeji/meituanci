<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/12
 * Time: 11:00
 */
class User extends CI_Controller
{
    /*构造函数*/
    public function __construct()
    {
        parent::__construct();
        $this -> load -> model("user_model");
        $this -> load -> model("order_model");
        $this -> load -> model("product_model");
    }

    public function login_page(){
        $this -> load -> view('login');
    }

    public function register_page(){
        $this -> load -> view('register');
    }

    public function login()
    {
        $username = $this -> input -> post("username");
        $password = $this -> input -> post("password");
        $row = $this -> user_model -> get_by_username_password($username, $password);
        if($row){
            $this->session->set_userdata(array(
                "userinfo" => $row
            ));
            redirect("welcome/index");
        }
        else
        {
            /*redirect("user/login_page");*/
            $data['error'] = "用户名或密码错误，请重新登陆！";
            $this -> load -> view('login',$data);
        }
    }
    public function register()
    {
        $username = $this -> input -> post("username");
        $password = $this -> input -> post("password");
        $row = $this -> user_model -> insert_user($username,$password);
        if($row > 0)
        {
            redirect("user/login_page");
        }
    }
    public function check_username(){
        $username = $this -> input -> post("username");
        $row = $this -> user_model -> check_username($username);
        if($row) echo "no";
        else echo "yes";
    }
    public function logout()
    {
        $this->session->unset_userdata('userinfo');

        /*if (isset($_COOKIE['userinfo'])) {
            delete_cookie('userinfo');
        }*/
        //var_dump($this->session->userinfo);
        //die(); 之后的操作都不执行
        //$this -> load -> view('index');不行，无法完成从数据库读取数据
        redirect("welcome/index", "refresh");
    }

    public function user_detail()
    {
        $userinfo = $this->session->userdata('userinfo');
        $user_id = $userinfo -> user_id;
        $order_list = $this -> order_model -> get_order_by_user_id($user_id);
        $data = array(
            'order_list' => $order_list
        );
        $this->load->view('user_detail', $data);
    }

    public function collect(){
        $userinfo=$this->session->userdata('userinfo');
        if(empty($userinfo)){
            echo 'fail';
        }
        else{
            $user_id=$userinfo->user_id;
            $product_id=$this->input->get("product_id");
            $row=$this->product_model->add_collect($user_id,$product_id);
            if($row>0){
                echo 'success';
            }
        }
    }

    public function cancel_collect(){
        $userinfo=$this->session->userdata('userinfo');
        $user_id=$userinfo->user_id;
        $product_id=$this->input->get("product_id");
        $row=$this->product_model->cancel_collect($user_id,$product_id);
        if($row>0){
            echo 'success';
        }
    }
}