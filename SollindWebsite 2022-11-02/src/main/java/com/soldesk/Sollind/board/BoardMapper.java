package com.soldesk.Sollind.board;

import java.util.List;

import com.soldesk.Sollind.home.HomeBoard;

public interface BoardMapper {
	public abstract List<HomeBoard> getBoard(Board b);
	public abstract BoardDdabong getBoardDdabong(BoardDdabong bd);
	public abstract Board getBoardDetail(Board b);
	public abstract List<BoardReply> getBoardReply(Board b);
	public abstract int insertBoard(Board b);
	public abstract int updateBoard(Board b);
	public abstract int deleteBoard(Board b);
	public abstract int insertReply(BoardReply br);
	public abstract int updateReply(BoardReply br);
	public abstract int deleteReply(BoardReply br);
}
