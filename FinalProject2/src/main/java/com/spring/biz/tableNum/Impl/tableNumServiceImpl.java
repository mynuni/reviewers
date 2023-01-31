package com.spring.biz.tableNum.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.tableNum.tableNumService;
import com.spring.biz.tableNum.tableNumVO;

@Service("tableNumService")
public class tableNumServiceImpl implements tableNumService{
	@Autowired
	private tableNumDAO tableNumDAO;
	
	@Override
	public String getValue(tableNumVO vo) {
		return tableNumDAO.getTableValue(vo);
	}

}
