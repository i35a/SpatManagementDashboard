/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC
 */
public class V_indicateur_fin_charge {
    private int id;
    private String designation;
    private String libelle_activite;
    private String role_utilisateur;
    private String categorie_rubrique;
    private String groupe_rubrique;
    private String groupe_rubrique_lib;
    private String type;
    private int periode_mensuel;
    private Double annee_n2;
    private Double annee_n1;
    private Double annee;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getLibelle_activite() {
        return libelle_activite;
    }

    public void setLibelle_activite(String libelle_activite) {
        this.libelle_activite = libelle_activite;
    }

    public String getRole_utilisateur() {
        return role_utilisateur;
    }

    public void setRole_utilisateur(String role_utilisateur) {
        this.role_utilisateur = role_utilisateur;
    }

    public String getCategorie_rubrique() {
        return categorie_rubrique;
    }

    public void setCategorie_rubrique(String categorie_rubrique) {
        this.categorie_rubrique = categorie_rubrique;
    }

    public String getGroupe_rubrique() {
        return groupe_rubrique;
    }

    public void setGroupe_rubrique(String groupe_rubrique) {
        this.groupe_rubrique = groupe_rubrique;
    }

    public String getGroupe_rubrique_lib() {
        return groupe_rubrique_lib;
    }

    public void setGroupe_rubrique_lib(String groupe_rubrique_lib) {
        this.groupe_rubrique_lib = groupe_rubrique_lib;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPeriode_mensuel() {
        return periode_mensuel;
    }

    public void setPeriode_mensuel(int periode_mensuel) {
        this.periode_mensuel = periode_mensuel;
    }

    public Double getAnnee_n2() {
        return annee_n2;
    }

    public void setAnnee_n2(Double annee_n2) {
        this.annee_n2 = annee_n2;
    }

    public Double getAnnee_n1() {
        return annee_n1;
    }

    public void setAnnee_n1(Double annee_n1) {
        this.annee_n1 = annee_n1;
    }

    public Double getAnnee() {
        return annee;
    }

    public void setAnnee(Double annee) {
        this.annee = annee;
    }
    
}
