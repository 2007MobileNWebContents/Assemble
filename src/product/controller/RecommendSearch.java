package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.RecommendService;
import product.model.vo.PageData;
import product.model.vo.Product;

/**
 * Servlet implementation class RecommendSearch
 */
@WebServlet("/recommend/search")
public class RecommendSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecommendService recommendservice;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		int currentPage = 0;
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		PageData pagedata = new RecommendService().recommendSearch(currentPage,search);
		ArrayList<Product> recomList = pagedata.getPageList();
		if(!recomList.isEmpty()&&recomList!=null) {
			request.setAttribute("recomList", recomList);
			request.setAttribute("pageNavi", pagedata.getPageNavi());
			request.getRequestDispatcher("/WEB-INF/views/recommend/recommendMain.jsp").forward(request, response);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('검색한 상품이 없습니다.'); location.href='/recommend/listview';</script>");
			writer.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
