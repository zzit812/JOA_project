package com.joalib.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joalib.DTO.ActionForward;
import com.joalib.donate.action.*;
import com.joalib.fault.action.FaultWriteAction;


@WebServlet("*.don")
public class DonateContr extends javax.servlet.http.HttpServlet{	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/donatePostWrite.don")) {
			action = new DonatePostWriteAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/donatePostDelete.don")) {
			action = new DonatePostDeleteAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/donatePostUpdate.don")) {
			action = new DonatePostUpdateAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/donateCommentAdd.don")) {
			action = new CommnetAddAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/donateCommentDel.don")) {
			action = new CommentDeleteAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/commentUpdate.don")) {
			action = new CommnetUpdateAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/smallCommentAdd.don")) {
			action = new SmallCommentAddAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/smallCommentDel.don")) {
			action = new SmallCommentDelAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/smallCommentChange.don")) {
			action = new SmallCommentChangeAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}else if(command.equals("/donateDealChange.don")) {
			action = new DonateDealChangeAction();
			try{ 
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace(); }
		}
		
		
		
		
		
		if(forward != null){		
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());	//��ȯ�ϴ� forward���� ������, 'forward.getPath()'���� �̵��Ѵ�.
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}			
		}	
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}
	
	
}
