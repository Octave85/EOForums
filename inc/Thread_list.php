<?php
class Thread_list extends EOForum {
	

	function __construct ($dbh, $tpl) {
		parent::__construct($dbh, $tpl);
	}

	public function fetch_threads($mode = 'thread_list', $params) {
		if (empty($params))
			die();

		switch ($mode) {
			case 'thread_list':
				$sql = 'SELECT * FROM threads WHERE ftid = :fid ORDER BY lastpost DESC LIMIT :perpage';
				$tl_query = $this->dbh->prepare($sql);
				$tl_query->bindParam(':fid', $params['fid'], PDO::PARAM_INT);
				$tl_query->bindParam(':perpage', $params['perpage'], PDO::PARAM_INT);
				$tl_query->execute();
				
				$rThreads = $tl_query->fetchAll(PDO::FETCH_ASSOC);
				foreach ($rThreads as $index => $data) {
					$rThreads[$index]['threadtimestamp'] = timeSincePost($data['threadtimestamp']);
					$rThreads[$index]['lastpost']        = timeSincePost($data['lastpost']);
				}
				return $rThreads;
				die();
				break;
			case 'tid':
				$sql = 'SELECT * FROM threads WHERE tid = :tid';
				$tid_query = $this->dbh->prepare($sql);
				$tid_query->bindParam(':tid', $params['tid'], PDO::PARAM_INT);
				$tid_query->execute();

				return $tid_query->fetch(PDO::FETCH_ASSOC);
				die();
				break;
		}
	}
}
?>