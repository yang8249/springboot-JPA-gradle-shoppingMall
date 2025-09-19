package com.yang.shopping.model;

public enum StatusType {
	REQUESTED("반품 요청됨"),
    PICKUP_SCHEDULED("수거 예약됨"),
    IN_TRANSIT("수거 중"),
    ARRIVED("물류센터 도착"),
    INSPECTING("검수 중"),
    APPROVED("처리 승인됨"),
    REJECTED("처리 거절됨"),
    REFUNDED("환불 완료"),
    EXCHANGED("교환 완료"),
    DISCARDED("폐기 처리됨");

    private final String description;

    StatusType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

}