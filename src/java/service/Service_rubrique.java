/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Rubrique_saisie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.V_rubrique_saisie;
/**
 *
 * @author PC
 */
public class Service_rubrique {
    public static List<V_rubrique_saisie> findAll() {
        List<V_rubrique_saisie> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_saisie";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_rubrique_saisie r = new V_rubrique_saisie();
                r.setDesignation(rs.getString("designation"));
                r.setLibelle_activite(rs.getString("libelle_activite"));
                r.setRole_utilisateur(rs.getString("role_utilisateur"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setAnnee1(rs.getDouble("annee1"));
                r.setAnnee2(rs.getDouble("annee2"));
                r.setAnnee3(rs.getDouble("annee3"));
                
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

     /* ===================== INSERT ===================== */
    public static boolean insert(Rubrique_saisie r) {
        String sql = "INSERT INTO rubrique_saisie " +
                "(designation, valeur_saisie, idactivite, idcateg_rubrique, periode_annuel) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql)) {

            ps.setString(1, r.getDesignation());
            ps.setDouble(2, r.getValeur_saisie());
            ps.setInt(3, r.getIdactivite());
            ps.setInt(4, r.getIdcateg_rubrique());
            ps.setInt(5, r.getPeriode_annuel());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
/* ===================== UPDATE ===================== */
    public static boolean update(Rubrique_saisie r) {
        String sql = "UPDATE rubrique_saisie SET " +
                " valeur_saisie=? WHERE designation=? AND periode_annuel=? ";

        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql)) {

            ps.setDouble(1, r.getValeur_saisie());
            ps.setString(2, r.getDesignation());
            ps.setInt(3, r.getPeriode_annuel());
            
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
