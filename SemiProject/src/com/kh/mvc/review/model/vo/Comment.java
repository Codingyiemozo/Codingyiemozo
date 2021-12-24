package com.kh.mvc.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int cm_no;
	
	private String cm_writer;
	
	private Date cm_submitdate;
	
	private String cm_content;
	
}
