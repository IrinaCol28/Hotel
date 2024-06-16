package com.example.hotel.services;

import com.example.hotel.models.User;
import com.example.hotel.models.enums.Role;
import com.example.hotel.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Класс для работы с данными пользователея.
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    /** Репозиторий пользователей */
    private final UserRepository userRepository;

    /** Поле пароля*/
    private final PasswordEncoder passwordEncoder;

    /**
     * Функция добавления нового пользователя
     * @return возвращает истину если создан, ложь если уже существует
     */
    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }

    /**
     * Функция для получения всех существующих пользователей
     * @return возвращает содержимое UserRepository
     */
    public List<User> list() {
        return userRepository.findAll();
    }

    /**
     * Функция для блокировки пользователей
     */
    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    /**
     * Функция для смены прав пользователя
     */
    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
