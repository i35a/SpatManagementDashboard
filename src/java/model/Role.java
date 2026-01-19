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
/**
 *
 * CREATE TABLE public.utilisateur (
    id SERIAL PRIMARY KEY,
    login INTEGER NOT NULL UNIQUE,
    pwd VARCHAR(100) NOT NULL,
    idrole INTEGER NOT NULL REFERENCES public.role(id),
    CONSTRAINT fk_employee_login FOREIGN KEY (login) REFERENCES employee(matricule)
);
 */

public class Role {
    @Attribute(attr_name = "id", attr_type = "serial", PrimaryKey = "primary key")
    Integer id; 
    @Attribute(attr_name = "description", attr_type = "varchar(100)")
    @Title(value = "description")
    String description;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
