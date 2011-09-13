<?php
class Forum {
	private $dbh = null;
	private $auth = null;
	private $tpl = null;

	function __construct($dbh, $tpl) {
		$this->dbh  = $dbh;
		$this->auth = 1;
		$this->tpl = $tpl;
	}

	public function push($template, $data = null) {
		foreach ($data as $key => $value) {
			$this->tpl->assign($key, $value);
		}
		$this->tpl->display($template);
	}

	public function fetch_all_forums() {
		$forums_query = $this->dbh->prepare("SELECT * FROM forums");
		$forums_query->execute();
		return $forums_query->fetchAll(PDO::FETCH_ASSOC);
	}
}
?>