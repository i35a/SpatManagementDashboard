/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.V_tendance_fin;

/**
 *
 * @author francky
 */
public class Service_tendance_fin {

    public static List<V_tendance_fin> getTendanceFin() {
        List<V_tendance_fin> list = new ArrayList<>();
        String sql = "SELECT * FROM v_tendance_fin";

        try (Connection cnx = DBConnectionOld.getConnection(); PreparedStatement ps = cnx.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                V_tendance_fin t = new V_tendance_fin();

                t.setDesignation(rs.getString("designation"));
                t.setPeriode_ann(rs.getInt("periode_annuel"));

                t.setJanvier(rs.getString("janvier"));
                t.setFevrier(rs.getString("fevrier"));  
                t.setMars(rs.getString("mars"));
                t.setAvril(rs.getString("avril"));
                t.setMai(rs.getString("mai"));
                t.setJuin(rs.getString("juin"));
                t.setJuillet(rs.getString("juillet"));
                t.setAout(rs.getString("aout"));
                t.setSeptembre(rs.getString("septembre"));
                t.setOctobre(rs.getString("octobre"));
                t.setNovembre(rs.getString("novembre"));
                t.setDecembre(rs.getString("decembre"));

                list.add(t);
            }

            cnx.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
