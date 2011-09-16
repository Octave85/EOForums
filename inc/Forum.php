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
		$tForums = $forums_query->fetchAll(PDO::FETCH_ASSOC);
		$rCats = array ();

		foreach ($tForums as $forum) {
			switch ($forum['forumtype']) {
				case 1:
					//Forum is a category
					$rCats[$forum['fid']] = $forum;
					$rCats[$forum['fid']]['children'] = array();
					break;
				case 0:
					//Forum is a normal forum
					$rCats["{$forum['parentid']}"]['children'][] = $forum['fid'];
					$rForums[$forum['fid']] = $forum;
					break;
			}
		}
		//pass cat. data to tpl in this form: catid => array(forumid, forumid, forumid)
		return array($rCats, $rForums);
	}
}
?>