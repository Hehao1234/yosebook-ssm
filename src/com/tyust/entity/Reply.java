package com.tyust.entity;

public class Reply {
	private String id;
	private String replyer;
	private String content;
	private String reply_for;
	private String commentId;
	private String bid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply_for() {
		return reply_for;
	}
	public void setReply_for(String reply_for) {
		this.reply_for = reply_for;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
}	
