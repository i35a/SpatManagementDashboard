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
import util.Title;

/**
 *
 * @author PC
 */
public class Employee {
    @Attribute(attr_name = "id", attr_type = "serial", PrimaryKey = "primary key")
    Integer id;
    @Attribute(attr_name = "matricule", attr_type = "integer")
    @Title(value = "matricule")
    Integer matricule;
    @Attribute(attr_name = "fullname", attr_type = "varchar(200)")
    @Title(value = "fullname")
    String fullname;
    @Attribute(attr_name = "utilisateur", attr_type = "varchar(200)")
    @Title(value = "utilisateur")
    String utilisateur;
    @Attribute(attr_name = "job_position", attr_type = "varchar(200)")
    @Title(value = "job_position")
    String job_position;
    @Attribute(attr_name = "idetablissement", attr_type = "integer")
    @Title(value = "idetablissement")
    Integer idetablissement;
    @Attribute(attr_name = "libelle", attr_type = "varchar(200)")
    @Title(value = "libelle")
    String libelle;
    @Attribute(attr_name = "etat", attr_type = "varchar(20)")
    @Title(value = "etat")
    String etat;
    @Attribute(attr_name = "comment", attr_type = "varchar(200)")
    @Title(value = "comment")
    String comment;
    @Attribute(attr_name = "site", attr_type = "varchar(200)")
    @Title(value = "site")
    String site;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMatricule() {
        return matricule;
    }

    public void setMatricule(Integer matricule) {
        this.matricule = matricule;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(String utilisateur) {
        this.utilisateur = utilisateur;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getJob_position() {
        return job_position;
    }

    public void setJob_position(String job_position) {
        this.job_position = job_position;
    }

    public Integer getIdetablissement() {
        return idetablissement;
    }

    public void setIdetablissement(Integer idetablissement) {
        this.idetablissement = idetablissement;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    
}
