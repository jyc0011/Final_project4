package com.finalproject.team4.shouldbe.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class UriUtil {

    public static String makeSearch(int page, String searchType, String keyword, String category,
                                    String postSort) {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("searchType", searchType)
                .queryParam("keyword", encoding(keyword))
                .queryParam("category", category)
                .queryParam("postSort", postSort)
                .build();

        return uriComponents.toUriString();
    }

    private static String encoding(String value) {
        if (value == null || value.trim().length() == 0) {
            return "";
        }

        return URLEncoder.encode(value, StandardCharsets.UTF_8);
    }

}