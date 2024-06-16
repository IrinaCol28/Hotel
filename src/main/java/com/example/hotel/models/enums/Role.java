package com.example.hotel.models.enums;
import org.springframework.security.core.GrantedAuthority;

/**
 * Перечисление для работы с ролями.
 */
public enum Role implements GrantedAuthority {
    ROLE_USER, ROLE_ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
