<?php

class EOForum {
	protected $dbh = null;
	protected $tpl = null;

	function __construct($dbh, $tpl) {
		$this->dbh = $dbh;
		$this->tpl = $tpl;
	}

	public function push($template, $data = null) {
		foreach ($data as $key => $value) {
			$this->tpl->assign($key, $value);
		}
		$this->tpl->display($template);
	}
}