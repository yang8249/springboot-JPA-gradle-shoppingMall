package com.yang.shopping.dto;

public class BulkLoadResponse {

    private int created;

    public BulkLoadResponse() {
    }

    public BulkLoadResponse(int created) {
        this.created = created;
    }

    public int getCreated() {
        return created;
    }

    public void setCreated(int created) {
        this.created = created;
    }
}
