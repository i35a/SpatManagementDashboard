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
public class V_rubrique_global {
    private int id;
    private String designation;
    private Double valeur_saisie;
    private int periode_annuel;
    private String activite_lib;
    private String role_utilisateur;
    private String categorie_rubrique;
    private String categorie_rubrique_lib;

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

    public Double getValeur_saisie() {
        return valeur_saisie;
    }

    public void setValeur_saisie(Double valeur_saisie) {
        this.valeur_saisie = valeur_saisie;
    }

    public int getPeriode_annuel() {
        return periode_annuel;
    }

    public void setPeriode_annuel(int periode_annuel) {
        this.periode_annuel = periode_annuel;
    }

    public String getActivite_lib() {
        return activite_lib;
    }

    public void setActivite_lib(String activite_lib) {
        this.activite_lib = activite_lib;
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

    public String getCategorie_rubrique_lib() {
        return categorie_rubrique_lib;
    }

    public void setCategorie_rubrique_lib(String categorie_rubrique_lib) {
        this.categorie_rubrique_lib = categorie_rubrique_lib;
    }
    
    
}
