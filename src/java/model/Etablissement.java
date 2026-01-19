/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;
import util.Attribute;
import util.Table;
import util.Title;
import util.Function;
/**
 *
 * @author PC
 */
public class Etablissement {
    @Attribute(attr_name = "id", attr_type = "serial", PrimaryKey = "primary key")
    Integer id;
    @Attribute(attr_name = "codeetablissement", attr_type = "integer")
    @Title(value = "codeetablissement")
    Integer codeetablissement;
    @Attribute(attr_name = "libelle", attr_type = "varchar(200)")
    @Title(value = "libelle")
    String libelle;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCodeetablissement() {
        return codeetablissement;
    }

    public void setCodeetablissement(Integer codeetablissement) {
        this.codeetablissement = codeetablissement;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    

    
    
}
