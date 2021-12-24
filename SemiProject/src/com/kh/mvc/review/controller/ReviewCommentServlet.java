package com.kh.mvc.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.review.model.service.CommentService;

@WebServlet("/review/comment")
public class ReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CommentService service = new CommentService();

    public ReviewCommentServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		String content = request.getParameter("rv_content");
    	HttpSession session = request.getSession(false);
    	
    	// 멤버 테이블을 가져오지 않아서 불러올 수 없음.
//    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;

    	// 로그인 여부 확인
    	/*
    	if(loginMember != null) {
			Comment comment = new Comment();
			
			comment.setCm_writer(loginMember.getName);
			comment.setWriterId(loginMember.getId());
			comment.setContent(content);
			
			int result = service.saveReply(reply);
			
			if(result > 0) {
         		request.setAttribute("msg", "댓글 등록 성공!");
         		request.setAttribute("location", "/board/view?no=" + boardNo);
			} else {
				request.setAttribute("msg", "댓글 등록 실패!");
         		request.setAttribute("location", "/board/view?no=" + boardNo);
			}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	 */
   	}
}
