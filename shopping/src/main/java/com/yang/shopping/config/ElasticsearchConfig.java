package com.yang.shopping.config;

import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.ssl.SSLContextBuilder;
import org.elasticsearch.client.RestClientBuilder;
import org.springframework.boot.autoconfigure.elasticsearch.ElasticsearchProperties;
import org.springframework.boot.autoconfigure.elasticsearch.RestClientBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

import javax.net.ssl.SSLContext;
import java.security.GeneralSecurityException;

@Configuration
public class ElasticsearchConfig {

    private final ElasticsearchProperties elasticsearchProperties;

    public ElasticsearchConfig(ElasticsearchProperties elasticsearchProperties) {
        this.elasticsearchProperties = elasticsearchProperties;
    }

    @Bean
    public RestClientBuilderCustomizer restClientBuilderCustomizer() {
        return new RestClientBuilderCustomizer() {
            @Override
            public void customize(RestClientBuilder builder) {
                try {
                    // SSLContext 생성: 개발용으로 모든 인증서 신뢰 (self-signed 허용)
                    SSLContext sslContext = SSLContextBuilder.create()
                            .loadTrustMaterial(null, (chain, authType) -> true)
                            .build();

                    builder.setHttpClientConfigCallback(httpClientBuilder -> {
                        httpClientBuilder.setSSLContext(sslContext);
                        httpClientBuilder.setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE);

                        if (StringUtils.hasText(elasticsearchProperties.getUsername())) {
                            BasicCredentialsProvider credentialsProvider = new BasicCredentialsProvider();
                            credentialsProvider.setCredentials(
                                    AuthScope.ANY,
                                    new UsernamePasswordCredentials(
                                            elasticsearchProperties.getUsername(),
                                            elasticsearchProperties.getPassword())
                            );
                            httpClientBuilder.setDefaultCredentialsProvider(credentialsProvider);
                        }

                        return httpClientBuilder;
                    });
                } catch (GeneralSecurityException e) {
                    throw new RuntimeException("Failed to configure SSL for Elasticsearch client", e);
                }
            }
        };
    }
}
