package com.hchan.spr.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BoardDto {
	private int id;
	private String title;
	private String body;
	private LocalDateTime inserted;
	private int numOfReplies;
	
	public String getPrettyInserted() {
		// 24 시간 이내면 시간만
		// 이전이면 년-월-일
		LocalDateTime now = LocalDateTime.now();
		if (now.minusHours(24).isBefore(inserted)) {
			return inserted.toLocalTime().toString(); 
		} else {
			return inserted.toLocalDate().toString();
		}
		
	}
	
}
