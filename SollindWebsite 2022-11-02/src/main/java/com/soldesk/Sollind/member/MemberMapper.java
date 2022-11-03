package com.soldesk.Sollind.member;

public interface MemberMapper {
	public abstract int mJoin(Member m);
	public abstract Member getMemberByID(Member m);
	public abstract int deleteID(Member m);
	public abstract int update(Member m);
}
