<?php

class Forum extends EOForum {
	private $fid = null;
	public $forum_data = null;

	function __construct($dbh, $tpl) {
		parent::__construct($dbh, $tpl);
	}

	public function set_fid($fid) {
		$this->fid = $fid;
		$sql = 'SELECT * FROM forums WHERE fid = :fid';
		$forum_query = $this->dbh->prepare($sql);
		$forum_query->bindParam(':fid', $fid, PDO::PARAM_INT);
		$forum_query->execute();
		$this->forum_data = $forum_query->fetch(PDO::FETCH_ASSOC);
	}

	public function generate_navbits() {
		$navbits = array(

		);
		$rNavbits = array();


		if ($this->forum_data['parentid'] === $this->forum_data['fid']) {
			$rNavbits[$this->forum_data['fid']] = $this->forum_data['forumname'];
		} else {
			$navbits[$this->forum_data['fid']] = $this->forum_data['forumname'];

			$current_fid = $this->forum_data['fid'];
			$current_parentid = $this->forum_data['parentid'];

			$sql = 'SELECT forums.fid, forums.forumname, forums.parentid FROM forums WHERE fid = :parentid';
			$navbit_query = $this->dbh->prepare($sql);

			while (1) {

				$navbit_query->bindParam(':parentid', $current_parentid);
				$navbit_query->execute();
				$navbit_data = $navbit_query->fetch();

				$navbits[$current_parentid] = $navbit_data['forumname'];

				$current_fid = $navbit_data['fid'];
				$current_parentid = $navbit_data['parentid'];

				if ($navbit_data['fid'] == $navbit_data['parentid'])
					break;
			}
		
			$navbits_fids = array_reverse(array_keys($navbits));
		
			foreach ($navbits_fids as $navfid) {
				$rNavbits[$navfid] = $navbits[$navfid];
			}

		}
		
		
		return $rNavbits;
	}

}