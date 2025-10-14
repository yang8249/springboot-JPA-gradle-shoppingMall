package com.yang.shopping.dto;

public class ReindexResponse {

    private int totalRecords;
    private int indexedRecords;

    public ReindexResponse() {
    }

    public ReindexResponse(int totalRecords, int indexedRecords) {
        this.totalRecords = totalRecords;
        this.indexedRecords = indexedRecords;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getIndexedRecords() {
        return indexedRecords;
    }

    public void setIndexedRecords(int indexedRecords) {
        this.indexedRecords = indexedRecords;
    }
}
