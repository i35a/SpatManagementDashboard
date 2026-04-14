/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Mois;
import model.V_indicateur_rh;
/**
 *
 * @author PC
 */
public class Service_mois {
    
    public static List<Mois> getMoisLib() {
        List<Mois> list = new ArrayList<>();
        String sql = "SELECT * FROM t_mois";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                  Mois r = new Mois(); 
                  r.setId(rs.getInt("id"));
                  r.setLibelle(rs.getString("libelle"));
                  list.add(r);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static Mois getCurrentMoisLib() {
        Mois res = new Mois();
        String sql = "SELECT * FROM t_mois where id = extract(month from current_date)";
                
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                  Mois r = new Mois(); 
                  r.setId(rs.getInt("id"));
                  r.setLibelle(rs.getString("libelle"));
                  res = r;
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public static Mois getMoisLibbyId(int n) {
        Mois m = new Mois();
        String sql = "SELECT * FROM t_mois where id = "+n;
                
        try (Connection cnx = DBConnectionOld.getConnection();
            PreparedStatement ps = cnx.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                  Mois r = new Mois(); 
                  r.setId(rs.getInt("id"));
                  r.setLibelle(rs.getString("libelle"));
                  m = r;
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }
    
}
