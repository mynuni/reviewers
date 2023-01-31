package com.spring.biz.tableNum.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.tableNum.tableNumVO;

@Repository
public class tableNumDAO {
@Autowired
private SqlSessionTemplate myBatis;

public String getTableValue(tableNumVO vo) {
	return myBatis.selectOne("tableNumDAO.getTableValue",vo);
}
}
