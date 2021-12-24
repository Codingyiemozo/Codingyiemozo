package com.kh.mvc.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int rv_no;
	
	private int cm_no;
	
	private String mem_nm;
	
	private int mem_no;
	
	private Date cm_date;
	
	private String cm_content;
	
}
