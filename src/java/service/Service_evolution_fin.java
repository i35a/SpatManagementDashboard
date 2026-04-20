/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import model.V_indicateur_rh;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.Rubrique_saisie;
import model.Utilisateur;
import model.V_evolution_annuel_fin;
import model.V_evolution_annuel_fin_prev;
import model.V_indicateur_fin;

/**
 *
 * @author PC
 */
public class Service_evolution_fin {
    public static List<V_evolution_annuel_fin> getEvolutionFin() {
        List<V_evolution_annuel_fin> list = new ArrayList<>();
        String sql = "SELECT * FROM evolution_annuel_fin order by designation , periode_mensuel ";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_evolution_annuel_fin r = new V_evolution_annuel_fin();
                r.setDesignation(rs.getString("designation"));
                r.setLibelle_activite(rs.getString("libelle_activite"));
                r.setRole_utilisateur(rs.getString("role_utilisateur"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setGroupe_rubrique(rs.getString("groupe_rubrique"));
                r.setGroupe_rubrique_lib(rs.getString("groupe_rubrique_lib"));
                r.setAnnee_n2(rs.getDouble("annee_n2")); 
                r.setAnnee_n1(rs.getDouble("annee_n2")); 
                r.setAnnee(rs.getDouble("annee")); 
                r.setPeriode_mensuel(rs.getInt("periode_mensuel"));
                
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<V_evolution_annuel_fin_prev> getEvolutionFinPrev() {
        List<V_evolution_annuel_fin_prev> list = new ArrayList<>();
        String sql = "SELECT * FROM evolution_annuel_fin_prev order by designation , periode_mensuel ";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_evolution_annuel_fin_prev r = new V_evolution_annuel_fin_prev();
                r.setDesignation(rs.getString("designation"));
                r.setLibelle_activite(rs.getString("libelle_activite"));
                r.setRole_utilisateur(rs.getString("role_utilisateur"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setGroupe_rubrique(rs.getString("groupe_rubrique"));
                r.setGroupe_rubrique_lib(rs.getString("groupe_rubrique_lib"));
                r.setAnnee_n2(rs.getDouble("annee_n2")); 
                r.setAnnee_n1(rs.getDouble("annee_n2")); 
                r.setAnnee(rs.getDouble("annee")); 
                r.setPeriode_mensuel(rs.getInt("periode_mensuel"));
                
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<V_evolution_annuel_fin> getEvolutionFin_actuel() {
        List<V_evolution_annuel_fin> list = new ArrayList<>();
        String sql = "SELECT * FROM evolution_annuel_fin where "
                + "  periode_annuel = extract(year from current_date)";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_evolution_annuel_fin r = new V_evolution_annuel_fin();
                r.setDesignation(rs.getString("designation"));
                r.setLibelle_activite(rs.getString("libelle_activite"));
                r.setRole_utilisateur(rs.getString("role_utilisateur"));
                r.setCategorie_rubrique(rs.getString("categorie_rubrique"));
                r.setGroupe_rubrique(rs.getString("groupe_rubrique"));
                r.setGroupe_rubrique_lib(rs.getString("groupe_rubrique_lib"));
                r.setAnnee_n2(rs.getDouble("annee_n2")); 
                r.setAnnee_n1(rs.getDouble("annee_n2")); 
                r.setAnnee(rs.getDouble("anne")); 
                
                list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static boolean update(V_evolution_annuel_fin r) {
        String sql = "UPDATE indicateur_fin SET " +
                " valeur_saisie=? WHERE designation=? AND periode_annuel=? AND periode_mensuel = ?";

        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql)) {

        //    ps.setString(1, r.getValeur_saisie());
        //    ps.setString(2, r.getDesignation());
        //    ps.setInt(3, r.getPeriode_annuel());
        //    ps.setInt(4, r.getPeriode_mensuel());
            
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static Object getByMois(V_indicateur_fin indic, String mois) {
    switch (mois.toLowerCase()) {
        case "janvier": return indic.getJanvier();
        case "fevrier": return indic.getFevrier();
        case "mars": return indic.getMars();
        case "avril": return indic.getAvril();
        case "mai": return indic.getMai();
        case "juin": return indic.getJuin();
        case "juillet": return indic.getJuillet();
        case "aout": return indic.getAout();
        case "septembre": return indic.getSeptembre();
        case "octobre": return indic.getOctobre();
        case "novembre": return indic.getNovembre();
        case "decembre": return indic.getDecembre();
        default: return null;
    }
}
}
