package com.yang.shopping.dto;

import java.util.List;

public class SuggestionResponse {

    private List<String> suggestions;

    public SuggestionResponse() {
    }

    public SuggestionResponse(List<String> suggestions) {
        this.suggestions = suggestions;
    }

    public List<String> getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(List<String> suggestions) {
        this.suggestions = suggestions;
    }
}
