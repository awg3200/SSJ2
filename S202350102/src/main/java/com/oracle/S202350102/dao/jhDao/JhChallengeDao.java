package com.oracle.S202350102.dao.jhDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

public interface JhChallengeDao {

	Challenge 		chgDetail(int chg_id);

	List<Board> 	chgReviewList(Board board);

	String 			userStatus(int userNum);

	Board 			reviewContent(int brd_num);

	List<Board>		reviewReplyList(Board board);

	int 			reviewTotal(int chg_id);

	int 			ingChgListTotal();

	List<Challenge> ingChgRecentList(Challenge challenge);

	List<Challenge> ingChgPickList(Challenge challenge);
 
	void 			replyInsert(Board board);

	int 			replyDelete(int brd_num);
	
	void 			viewCntUp(int brd_num);
 
	int 			replyUpdate(Board board);

	int 			reviewPost(Board board);

	int 			reviewUpdate(Board board);

	void 			reviewDelete(int brd_num);   
   
}    
  