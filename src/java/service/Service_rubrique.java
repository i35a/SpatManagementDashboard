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
import model.Role;
import model.Utilisateur;
import model.V_rubrique_fin;
import model.V_rubrique_global;
import model.V_rubrique_op;
import model.V_rubrique_saisie;
/**
 *
 * @author PC
 */
public class Service_rubrique {
    public static List<V_rubrique_saisie> getRubriqueRH() {
        List<V_rubrique_saisie> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_rh";
                
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
    public static List<V_rubrique_fin> getRubriqueFIN() {
        List<V_rubrique_fin> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_fin";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_rubrique_fin r = new V_rubrique_fin();
                r.setDesignation(rs.getString("designation"));
                r.setLibelle_activite(rs.getString("libelle_activite"));
                r.setRole_utilisateur(rs.getString("role_utilisateur"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setAnnee1(rs.getDouble("annee1"));
                r.setAnnee2(rs.getDouble("annee2"));
                r.setAnnee3(rs.getDouble("annee3"));
                r.setAnnee4(rs.getDouble("annee4"));
                r.setAnnee5(rs.getDouble("annee5"));
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<V_rubrique_op> getRubriqueOP() {
        List<V_rubrique_op> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_op";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_rubrique_op r = new V_rubrique_op();
                r.setDesignation(rs.getString("designation"));
                r.setLibelle_activite(rs.getString("libelle_activite"));
                r.setRole_utilisateur(rs.getString("role_utilisateur"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setAnnee1(rs.getDouble("annee1"));
                r.setAnnee2(rs.getDouble("annee2"));
                r.setAnnee3(rs.getDouble("annee3"));
                r.setAnnee4(rs.getDouble("annee4"));
                r.setAnnee5(rs.getDouble("annee5"));
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<V_rubrique_global> getRubriqueGlobal_RH() {
        List<V_rubrique_global> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_global where activitie_lib = 'ACT_RH'";
             
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_rubrique_global r = new V_rubrique_global();
                r.setId(rs.getInt("id"));
                r.setDesignation(rs.getString("designation"));
                r.setActivite_lib(rs.getString("activite_lib"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setCategorie_rubrique_lib(rs.getString("categorie_rubrique_lib"));
                r.setPeriode_annuel(rs.getInt("periode_annuel"));
                r.setValeur_saisie(rs.getDouble("valeur_saisie"));
                r.setGroupe_rub(rs.getString("groupe_rub"));
                r.setGroupe_rub_lib(rs.getString("groupe_rub_lib"));
                
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<V_rubrique_global> getRubriqueGlobal_FIN() {
        List<V_rubrique_global> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_global where activitie_lib = 'ACT_FIN'";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_rubrique_global r = new V_rubrique_global();
                r.setId(rs.getInt("id"));
                r.setDesignation(rs.getString("designation"));
                r.setActivite_lib(rs.getString("activite_lib"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setCategorie_rubrique_lib(rs.getString("categorie_rubrique_lib"));
                r.setPeriode_annuel(rs.getInt("periode_annuel"));
                r.setValeur_saisie(rs.getDouble("valeur_saisie"));
                r.setGroupe_rub(rs.getString("groupe_rub"));
                r.setGroupe_rub_lib(rs.getString("groupe_rub_lib"));
                
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<V_rubrique_global> getRubriqueGlobal_OP() {
        List<V_rubrique_global> list = new ArrayList<>();
        String sql = "SELECT * FROM v_rubrique_global where activitie_lib = 'ACT_OP'";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_rubrique_global r = new V_rubrique_global();
                r.setId(rs.getInt("id"));
                r.setDesignation(rs.getString("designation"));
                r.setActivite_lib(rs.getString("activite_lib"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setCategorie_rubrique_lib(rs.getString("categorie_rubrique_lib"));
                r.setPeriode_annuel(rs.getInt("periode_annuel"));
                r.setValeur_saisie(rs.getDouble("valeur_saisie"));
                r.setGroupe_rub(rs.getString("groupe_rub"));
                r.setGroupe_rub_lib(rs.getString("groupe_rub_lib"));
                
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
