package com.soldesk.Sollind.home;

import java.util.List;

import com.soldesk.Sollind.board.Board;
import com.soldesk.Sollind.company.Company;

public interface HomeMapper {
	public abstract List<Board> getBestBoard();
	public abstract List<HomeBoard> getBoardPart(String type);
	public abstract List<HomeBoard> searchBoard(Search2 se);
	public abstract List<Company> searchCompany(Search2 se);
}
