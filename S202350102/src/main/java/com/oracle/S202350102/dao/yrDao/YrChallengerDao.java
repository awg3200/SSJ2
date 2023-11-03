package com.oracle.S202350102.dao.yrDao;

import java.util.List;

import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.User1;

public interface YrChallengerDao {
	List<User1> 	listSsj(int chg_id);
	int 			insertChgr(Challenger chgr);
	int 			selectChgrParti(int chg_id);

}
