package model;

import javax.servlet.http.HttpServletRequest;

public class PagingBean {
	private int currentPage = 1; 	// ���� ������
	private int totalRecord; 		// �� ���ڵ� ��
	private int recordSize = 10; 	// �������� ������ ���ڵ� ��
	private int totalPage;			// �� ������ ��
	private int blockSize = 10;		// ���� ������ ������ ��
	private int firstPage; 			// ���� ���� ������
	private int lastPage; 			// ���� ������ ������
	private int curPos; 			// �������� ���� index(list�迭��)
	private int num; 				// �������� ���� ��ȣ

	public PagingBean(HttpServletRequest request, int total) {
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(	request.getParameter("currentPage"));
		}
		totalRecord = total;
		totalPage=(int)Math.ceil((float)totalRecord/recordSize);
		firstPage=currentPage-((currentPage-1)%blockSize);
		lastPage=firstPage+(blockSize-1);
		curPos=(currentPage-1)*recordSize; 
		num=totalRecord-curPos;
	}	

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getRecordSize() {
		return recordSize;
	}
	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getCurPos() {
		return curPos;
	}
	public void setCurPos(int curPos) {
		this.curPos = curPos;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}	
}