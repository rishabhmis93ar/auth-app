package com.iimt.auth.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iimt.auth.model.User;
import com.iimt.auth.utils.DBUtil;

public class UserDAO {

    public boolean emailExists(String email) throws Exception {
        String sql = "SELECT 1 FROM users WHERE email = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email.toLowerCase().trim());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void createUser(String name, String email, String passwordHash) throws Exception {
        String sql = "INSERT INTO users(name, email, password_hash) VALUES (?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name.trim());
            ps.setString(2, email.toLowerCase().trim());
            ps.setString(3, passwordHash);
            ps.executeUpdate();
        }
    }

    public User findByEmail(String email) throws Exception {
        String sql = "SELECT id, name, email, password_hash FROM users WHERE email = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email.toLowerCase().trim());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password_hash")
                    );
                }
                return null;
            }
        }
    }
}