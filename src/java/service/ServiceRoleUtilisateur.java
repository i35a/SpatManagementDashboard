/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.GenericDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//import model.Typearticle;
import model.TypeRoleUtilisateur;

/**
 *
 * @author PC
 */
public class ServiceRoleUtilisateur {
    
    public static ArrayList<TypeRoleUtilisateur> getAllType(Connection con){
        ArrayList<TypeRoleUtilisateur> result = new ArrayList<TypeRoleUtilisateur>();
        String sql = "SELECT * FROM role";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                // Typearticle tp = new Typearticle();
                TypeRoleUtilisateur tp = new TypeRoleUtilisateur();
                tp.setId(rs.getInt("id"));
                tp.setDescription(rs.getString("description"));
                 
                result.add(tp);
            }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return result;
    }
    public static TypeRoleUtilisateur getTypeById(int idtype, Connection con){
        TypeRoleUtilisateur tp = new TypeRoleUtilisateur();
        String sql = "SELECT * FROM role WHERE id= "+idtype;
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){ 
                tp.setId(rs.getInt("id"));
                tp.setDescription(rs.getString("description"));
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return tp;
    }
    public static ArrayList<TypeRoleUtilisateur> gettypeByLibelle(String pDescription, Connection con){
        ArrayList<TypeRoleUtilisateur> res = new ArrayList<TypeRoleUtilisateur>();//int idtype = 1;
        String sql = "SELECT * FROM role ";//WHERE libelle = '"+libelle+"'";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                TypeRoleUtilisateur tp = new TypeRoleUtilisateur();
                tp.setId(rs.getInt("id"));//idtype = rs.getInt("idtypeart");
                tp.setDescription(rs.getString("description"));
              
                res.add(tp);
            }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return res;
    }
}
