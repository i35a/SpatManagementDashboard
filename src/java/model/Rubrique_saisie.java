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
public class Rubrique_saisie {
    private int id;
    private String designation;
    private double valeur_saisie;
    private int idactivite;
    private int idcateg_rubrique;
    private int periode_annuel;

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

    public double getValeur_saisie() {
        return valeur_saisie;
    }

    public void setValeur_saisie(double valeur_saisie) {
        this.valeur_saisie = valeur_saisie;
    }

    public int getIdactivite() {
        return idactivite;
    }

    public void setIdactivite(int idactivite) {
        this.idactivite = idactivite;
    }

    public int getIdcateg_rubrique() {
        return idcateg_rubrique;
    }

    public void setIdcateg_rubrique(int idcateg_rubrique) {
        this.idcateg_rubrique = idcateg_rubrique;
    }

    public int getPeriode_annuel() {
        return periode_annuel;
    }

    public void setPeriode_annuel(int periode_annuel) {
        this.periode_annuel = periode_annuel;
    }
    
    
    
}
