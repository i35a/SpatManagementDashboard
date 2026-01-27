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
import model.Annee;
import model.V_rubrique_saisie;

/**
 *
 * @author PC
 */
public class Service_annee {
    public static Annee findAnnee(String desc) {
        List<Annee> list = new ArrayList<>();
        String sql = "SELECT * FROM annee where description ='"+desc+"'";
        Annee a = new Annee();        
        try (Connection cnx = DBConnectionOld.getConnection();
             PreparedStatement ps = cnx.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                
                //a.setDescription(rs.getString("description"));
                a.setValeur(rs.getInt("valeur"));
                
                //list.add(a);
            }
            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
}
