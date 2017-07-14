<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
    public function __construct()
    {
        parent::__construct();
        $this -> load -> model("product_model");
        $this -> load -> model("order_model");
    }
	public function index()
	{
        $results=$this->product_model->get_product();
        foreach($results as $product)
        {
            $num=$this->order_model->get_count_by_product_id($product->product_id);

            $product->num= $num->num==null ? 0:$num->num;
        }
		$this->load->view('index',array('results'=>$results));
	}

    public function detail()
    {
        $this -> load -> view('detail');
    }
}
