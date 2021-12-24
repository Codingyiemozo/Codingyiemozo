package com.kh.mvc.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int rv_no;
	
	private String rv_type;
	
	private String rv_title;
	
	private String rv_img_path;
	
	private String rv_date;
	
	private String rv_content;
	
	private String rv_comment;
	
	private int rv_hits;
	
	private int mem_no;
	
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
