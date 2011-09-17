<?php

class Forum extends EOForum {
	private $fid = null;
	public $forum_data = null;

	function __construct($dbh, $tpl, $fid) {
		parent::__construct($dbh, $tpl);
		
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

		if ($this->forum_data['parentid'] === $this->forum_data['fid']) {
			$navbits[$this->forum_data['fid']] = $this->forum_data['forumname'];
		} else {
			$current_fid = $this->forum_data['fid'];
			$current_parentid = $this->forum_data['parentid'];

			while (1) {
				$sql = 'SELECT forums.fid, forums.forumname, forums.parentid FROM forums WHERE fid = :parentid';
				$navbit_query = $this->dbh->prepare($sql);

				$navbit_query->bindParam(':parentid', $current_parentid);
				$navbit_query->execute();
				$navbit_data = $navbit_query->fetch();

				$navbits[$current_fid] = $navbit_data['forumname'];
				
				$current_fid = $navbit_data['fid'];
				$current_parentid = $navbit_data['parentid'];

				if ($current_fid != $this->forum_data['parentid'])
					break;
			}
		
		}
		
		$navbits[$this->forum_data['fid']] = $this->forum_data['forumname'];

		return $navbits;
	}

}