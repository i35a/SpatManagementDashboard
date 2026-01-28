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
public class V_PercentBudget_actuel {
    private String groupe_rub;
    private String groupe_rub_lib;
    private Double realisation;
    private Double budget;
    private Double pourcentage_budget;
    private String activite_lib;
    private String role_utilisateur;
            
    public String getGroupe_rub() {
        return groupe_rub;
    }

    public void setGroupe_rub(String groupe_rub) {
        this.groupe_rub = groupe_rub;
    }

    public String getGroupe_rub_lib() {
        return groupe_rub_lib;
    }

    public void setGroupe_rub_lib(String groupe_rub_lib) {
        this.groupe_rub_lib = groupe_rub_lib;
    }

    public Double getRealisation() {
        return realisation;
    }

    public void setRealisation(Double realisation) {
        this.realisation = realisation;
    }

    public Double getBudget() {
        return budget;
    }

    public void setBudget(Double budget) {
        this.budget = budget;
    }

    public Double getPourcentage_budget() {
        return pourcentage_budget;
    }

    public void setPourcentage_budget(Double pourcentage_budget) {
        this.pourcentage_budget = pourcentage_budget;
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
    
    
}
