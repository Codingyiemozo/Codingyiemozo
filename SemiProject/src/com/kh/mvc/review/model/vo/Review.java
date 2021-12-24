package com.kh.mvc.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int rv_no;
	
	private String rv_title;
	
	private String rv_date;
	
	private int rv_hits;
	
	private String rv_content;
	
	private String rv_group;
//	
//	private String originalFileName;
//	
//	private String renamedFileName;
//	
//	private int readCount;
//	
//	private String status;
//	
//	private List<Reply> replies;
//	
//	private Date createDate;
//	
//	private Date modifyDate;
}
