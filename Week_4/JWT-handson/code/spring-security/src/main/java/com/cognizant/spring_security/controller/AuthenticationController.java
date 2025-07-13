package com.cognizant.spring_security.controller;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AuthenticationController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationController.class);

    @GetMapping("/authenticate")
    public Map<String, String> authenticate(@RequestHeader("Authorization") String authHeader) {
        LOGGER.debug("START: authenticate()");
        LOGGER.debug("Authorization Header: {}", authHeader);

        String user = getUser(authHeader);
        LOGGER.debug("Extracted User: {}", user);

        String token = generateJwt(user);

        Map<String, String> map = new HashMap<>();
        map.put("token", token);

        LOGGER.debug("Generated Token: {}", token);
        LOGGER.debug("END: authenticate()");
        return map;
    }

    private String getUser(String authHeader) {
        LOGGER.debug("START: getUser()");
        String encodedCredentials = authHeader.substring("Basic ".length());
        byte[] decodedBytes = Base64.getDecoder().decode(encodedCredentials);
        String decodedString = new String(decodedBytes);
        LOGGER.debug("Decoded Credentials: {}", decodedString);
        String username = decodedString.split(":")[0];
        LOGGER.debug("END: getUser()");
        return username;
    }

    private String generateJwt(String user) {
        LOGGER.debug("START: generateJwt()");

        String token = Jwts.builder()
                .setSubject(user)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 1200000))
                .signWith(Keys.hmacShaKeyFor("secretkeysecretkeysecretkeysecretkeysecretkeysecretkeysecretkey12".getBytes()), SignatureAlgorithm.HS256)
                .compact();

        LOGGER.debug("END: generateJwt()");
        return token;
    }
}
