package com.soldesk.Sollind.company;

import java.util.List;

import com.soldesk.Sollind.board.Board;

public interface companyMapper {
	public abstract List<Company> getCompanyInfo();
	public abstract Company getCompanyAllInfo(Company c);
	public abstract int insertCompanyReview(CompanyReview cr);
	public abstract int updateCompanyScore(Company c);
	public abstract List<CompanyReview> getCompanyReview(Company c);
	public abstract List<Board> getCompanyBoard(Company c);
	public abstract int deleteCompanyReview(CompanyReview cr);
	public abstract int updateCompanyCount(Company c);
}
