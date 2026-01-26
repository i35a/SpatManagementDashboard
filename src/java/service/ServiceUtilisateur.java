/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.aspose.cells.Workbook;
import com.aspose.cells.Worksheet;
import dao.GenericDao;
import static excelexport.ExcelExport.removeExcelSheet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List; 
import model.Utilisateur;
import utils.Utils;
import service.ServiceRoleUtilisateur;
import model.TypeRoleUtilisateur;

/**
 *
 * @author Mon PC
 */
public class ServiceUtilisateur {

    public static Utilisateur getUserByLogin(int userMatricule, Connection con) {
        Utilisateur foundUser = new Utilisateur();
        String sql = "SELECT id,login,pwd,idrole,user_locked FROM utilisateur WHERE login=? ";

        try {
            PreparedStatement ps = con.prepareStatement(sql); 
            ps.setObject(1, userMatricule);
            ResultSet rs = ps.executeQuery();
            System.out.println("-----searching for user"+ userMatricule);
            while (rs.next()) {
                System.out.println("--finding someone..");
                if (rs.getString("id") != null) {
                    foundUser.setId(Integer.parseInt(rs.getString("id")));
                    System.out.println("---found id: "+rs.getString("id"));
                } else {
                    System.out.println("null id");
                }
                if (rs.getString("idrole") != null) {
                    foundUser.setIdRole(Integer.parseInt(rs.getString("idrole")));
                } else {
                    System.out.println("null idrole");
                }
                if (rs.getString("pwd") != null) {
                    foundUser.setPwd(rs.getString("pwd"));
                    System.out.println("hash found: "+foundUser.getPwd());
                } else {
                    System.out.println("null pwd");
                }
                if (rs.getString("login") != null) {
                    foundUser.setLogin(Integer.valueOf(rs.getString("login")));
                    System.out.println(foundUser.getLogin());
                } else {
                    System.out.println("null login");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return foundUser;
    }

    public static ArrayList<Utilisateur> getAllItems(Utilisateur searchUser, Connection con) {
        ArrayList<Utilisateur> result = new ArrayList<Utilisateur>();
        String sql = "SELECT * FROM v_utilisateur WHERE 1=1 AND (user_locked IS NULL OR user_locked=FALSE) ";
        if (searchUser.getFullname() != null) {
            sql = sql + " AND lower(fullname) like '%" + searchUser.getFullname() + "%' ";
            
//            try{
//            int userLogin = Integer.parseInt(searchUser.getFullname());
//            if(userLogin>0)
//            sql +=" AND lower(cast(login AS TEXT)) ilike '%" + userLogin + "%'";
//            }catch(Exception e){
//                
//            }
        }
        if (searchUser.getIdRole() != null) { 
            sql = sql + " AND idrole=" + searchUser.getIdRole() + "";
            System.out.println("ID ROLE FOUND:"+ searchUser.getIdRole());
        } else {
            System.out.println("null id role");
        }
//        if (searchUser.getFullname() != null) {
//            sql = sql + " AND lower(cast(login AS TEXT)) ilike '%" + searchUser.getFullname() + "%'";
//            System.out.println("***Searching login: "+ searchUser.getFullname()+"***\n");
//        } else {
//            System.out.println("null login" + searchUser.getFullname());
//        }

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Utilisateur foundUser = new Utilisateur();
                if (rs.getString("id") != null) {
                    foundUser.setId(Integer.parseInt(rs.getString("id")));
                } else {
                    System.out.println("null id");
                }
                if (rs.getString("idrole") != null) {
                    foundUser.setIdRole(Integer.parseInt(rs.getString("idrole")));
                } else {
                    System.out.println("null idrole");
                }
                if (rs.getString("fullname") != null) {
                    foundUser.setFullname(rs.getString("fullname"));
                } else {
                    System.out.println("null fullname");
                }
                if (rs.getString("login") != null) {
                    foundUser.setLogin(Integer.parseInt(rs.getString("login")));
                } else {
                    System.out.println("null login");
                }
                result.add(foundUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /*public static ArrayList<Article> getAllitems(Article article, Connection con){
        ArrayList<Article> result = new ArrayList<Article>();
        String sql = "SELECT * FROM v_article";
        sql = sql + " WHERE 1=1";
        if(article.getDesignation() != null) sql = sql + " AND lower(designation) like '%"+article.getDesignation()+"%'";
        if(article.getIdtypeart() != null) sql = sql + " AND idtypeart = "+article.getIdtypeart()+"";
        if(article.getDateadd() != null )  sql = sql + " AND ('"+article.getDateadd()+"'::date - dateadd::date) = 0"; 
        //("+"'"+article.getDateadd()+"'::date - dateadd::date) = 0
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                Article art = new Article();
                
                art.setIdart(rs.getInt("idart"));
                art.setIdtypeart(rs.getInt("idtypeart"));
                art.setDesignation(rs.getString("designation"));
                art.setEtat(rs.getString("etat"));
                art.setDateadd(rs.getDate("dateadd"));
                art.setQtealert(rs.getInt("qtealert"));
                art.setReference(rs.getString("reference"));
                art.setFabricant(rs.getString("fabricant"));
                if(rs.getString("comment") != null)
                art.setComment(rs.getString("comment"));
                String c = "N";
                if(rs.getString("seuilalert") != null) 
                      c = rs.getString("seuilalert");
                art.setSeuilalert(c.charAt(0));
                
                result.add(art);
              
            }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return result;
    }*/
    public static String addUser(List<Utilisateur> listUser, Connection con) {
        String res = "";

        String sql = "INSERT INTO utilisateur(login,pwd, idrole)"
                + " VALUES (?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            int count = 1;
            //int idarticle = getLastNumRowArticle(con);

            for (Utilisateur user : listUser) {
                //st.setInt(1, idarticle+count); // dernière numéro en base
                st.setInt(1, user.getLogin());
                st.setString(2, Utils.hashPasswordBcrypt(user.getPwd()));
                st.setInt(3, user.getIdRole());
                st.addBatch();

                // execute every 100 rows or less
                //if (count % 100 == 0 || count == listart.size()) {
                if (count == listUser.size()) {
                    st.executeBatch();
                }
                count++;
            }
            res = "1";

        } catch (Exception e) {
            res = e.getMessage();
            e.printStackTrace();
        }

        return res;
    }

    public static int updateArticle(Utilisateur user, Connection con) {
        int res = 0;
        String sql = "UPDATE utilisateur SET pwd =?,idrole=? WHERE id= ?";
        boolean newPassword = user.getPwd() != null && !user.getPwd().trim().isEmpty();
        try {
            PreparedStatement ps = null;
            if (!newPassword) {
                sql = "UPDATE utilisateur SET idrole=? WHERE id= ?";
                ps = con.prepareStatement(sql);
                ps.setObject(1, user.getIdRole());
                ps.setObject(2, user.getId());
            } else {
                ps = con.prepareStatement(sql);
                ps.setObject(1, Utils.hashPasswordBcrypt(user.getPwd()));
                ps.setObject(2, user.getIdRole());
                ps.setObject(3, user.getId());
            }
            ps.executeUpdate();
//            ps.setString(1, art.getDesignation());
//            ps.setInt(2, art.getIdtypeart());
//            ps.setString(3, art.getEtat());
//            ps.setInt(4, art.getQtealert());
//            ps.setString(5, art.getReference());
//            ps.setString(6, art.getFabricant()); 
//            ps.setString(7, art.getComment());
//            ps.setInt(8, art.getIdart());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /*public static int updateArticle(Article art, Connection con){
        int res = 0;
        String sql = "UPDATE article SET designation = ?,idtypeart = ?,etat=?,qtealert=?, reference=? , fabricant =?, comment=? WHERE idart = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, art.getDesignation());
            ps.setInt(2, art.getIdtypeart());
            ps.setString(3, art.getEtat());
            ps.setInt(4, art.getQtealert());
            ps.setString(5, art.getReference());
            ps.setString(6, art.getFabricant()); 
            ps.setString(7, art.getComment());
            ps.setInt(8, art.getIdart());
            ps.executeUpdate();
        
        }catch(Exception e){
            e.printStackTrace();
        }          
        return res;
    }
    public static int getLastNumRowArticle(Connection con){
        int lastnum = 1;
        String sql = "SELECT max(idart)as maxnum FROM v_article";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                //Article art = new Article();
                lastnum = rs.getInt("maxnum");
            }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return lastnum;
    }
    public static void exportArticleToExcel(List<Article> article, String filePath, String sheetName, String... columns) throws Exception {
        Workbook book = new Workbook();
        Worksheet sheet = book.getWorksheets().get(0);
        sheet.setName(sheetName);
        sheet.getCells().importCustomObjects((Collection) article,
        columns,
        true, // isPropertyNameShown
        0, // firstRow
        0, // firstColumn
        article.size(), // Number of objects to be exported
        true, // insertRows
        null, // dateFormatString
        false); // convertStringToNumber
        book.save(filePath);
        removeExcelSheet(filePath, 1);
    }
     */
}
