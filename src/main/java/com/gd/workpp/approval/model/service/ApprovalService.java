package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;

public interface ApprovalService {

	int selectApprovalCount();
	
	ArrayList<Document> selectApprovalList(PageInfo pi);
}
