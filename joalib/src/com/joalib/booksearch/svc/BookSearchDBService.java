package com.joalib.booksearch.svc;

import java.util.List;

import com.joalib.DAO.BookSearchDAO;
import com.joalib.DAO.DAO;
import com.joalib.DTO.SearchDTO;

public class BookSearchDBService {

	public List<SearchDTO> dbsearch(SearchDTO sdto) {
		
//		System.out.println("sdto" + sdto.getOption());
//		System.out.println("sdto" + sdto.getText());
		
		BookSearchDAO dao = new BookSearchDAO();
		List<SearchDTO> book_search = dao.select_book(sdto);
		
		System.out.println(book_search.get(0).getAuthor());
		System.out.println(book_search.get(0).getBook_title());
		
		return book_search;
	}

}
