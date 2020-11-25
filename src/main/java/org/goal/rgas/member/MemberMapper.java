package org.goal.rgas.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface MemberMapper {
    public List<Member> list(Member member) throws Exception;
    public List<Member> selectAll(Member member) throws Exception;
    public Member select(Member member) throws Exception;
    public void insert(Member member) throws Exception;
    public void update(Member member) throws Exception;
    public void delete(Member member) throws Exception;
}