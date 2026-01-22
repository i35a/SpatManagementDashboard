/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import util.Attribute;
import util.Table;
import util.Title;

/**
 *
 * @author PC
 */
@Table(tbl_name = "role")
public class TypeRoleUtilisateur {
    @Attribute(attr_name = "id", attr_type = "serial", PrimaryKey = "primary key")
    Integer id;
    @Attribute(attr_name = "description", attr_type = "description")
    @Title(value = "description")
    String description;
   
    public TypeRoleUtilisateur() {
    }

    // public Typearticle(Integer idtypeart) {
    //     setIdtypeart(idtypeart);
    // }
    public Integer getId() {
        return id;
    }

    public void setId(Integer idRole) {
        this.id= idRole;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String pDescription) {
        this.description = pDescription;
    }

    
}

