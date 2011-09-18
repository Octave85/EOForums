<?php

class EOForum {
	protected $dbh = null;
	protected $tpl = null;

	private $error_types = array(
		'forumdisplay_invalidfid' => 'Invalid Forum Specified', 
		'forumdisplay_nofid'      => 'No Forum Specified',
		'categorydisplay_nosubforums' => 'No Subforums',
	);

	private $error_messages = array(
		'forumdisplay_invalidfid' => 'Invalid forum specified. If you followed a link here, please contact the administrator.',
		'forumdisplay_nofid'      => 'No forum specified.',
		'categorydisplay_nosubforums' => 'No subforums found.',
	);

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

	public function add($data = null) {
		foreach ($data as $key => $value) {
			$this->tpl->assign($key, $value);
		}
	}

	public function error($type, $abbrev) {
		$error_tpldata = array();
		if (array_key_exists($abbrev, $this->error_types) && array_key_exists($abbrev, $this->error_messages)) {
			$error_tpldata['error_type'] = $this->error_types[$abbrev];
			$error_tpldata['error_message'] = $this->error_messages[$abbrev];
		}

		switch ($type) {
			case 'info':
				$this->tpl->assign('error_type', $error_tpldata['error_type']);
				$this->tpl->assign('error_message', $error_tpldata['error_message']);
				$this->tpl->display('error.tpl');
				break;
			case 'warning':
				break;
		}
		die();
	}

	function get($var, $criteria) {		
		if ( ! isset($_GET[$var]))
				return false;

		if ( ! empty($criteria)) {
			$c_array = explode('|', $criteria);

			foreach ($c_array as $criteria):
				
				switch ($criteria) {
					case 'num':
						if ( ! is_numeric($_GET[$var]))
							return false;
						break;
				}

			endforeach;

			return $_GET[$var];

		} else {
			return $_GET[$var];
		}
	}
}