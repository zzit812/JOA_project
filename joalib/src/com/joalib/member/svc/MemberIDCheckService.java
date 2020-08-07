package com.joalib.member.svc;

import java.util.List;

import com.joalib.DTO.memberinfoDTO;

import com.joalib.DAO.memberinfoDAO;

public class MemberIDCheckService {
	
	public List<memberinfoDTO> IDCheck (String checkID) throws Exception {
		
		memberinfoDAO dao = new memberinfoDAO();
		List<memberinfoDTO> memberinfo = dao.memberIDCheck(checkID);
		
		return memberinfo;
	}

}