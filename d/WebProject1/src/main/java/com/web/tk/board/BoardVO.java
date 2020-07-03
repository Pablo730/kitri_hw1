package com.web.tk.board;
 
public class BoardVO {
	private int NUM;
	private String USER_ID;
	private String CONTENT;
	private String IN_DATE;
	private String USE_YN;
	private int START;
	private int END;
	public int getNUM() {
		return NUM;
	}
	public void setNUM(int nUM) {
		NUM = nUM;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getIN_DATE() {
		return IN_DATE;
	}
	public void setIN_DATE(String iN_DATE) {
		IN_DATE = iN_DATE;
	}
	public String getUSE_YN() {
		return USE_YN;
	}
	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}
	public int getSTART() {
		return START;
	}
	public void setSTART(int sTART) {
		START = sTART;
	}
	public int getEND() {
		return END;
	}
	public void setEND(int eND) {
		END = eND;
	}
}
