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

public class Utilisateur {
    @Attribute(attr_name = "id", attr_type = "serial", PrimaryKey = "primary key")
    Integer id;
    @Attribute(attr_name = "login", attr_type = "integer")
    @Title(value = "login")
    Integer login;
    @Attribute(attr_name = "pwd", attr_type = "varchar(100)")
    @Title(value = "pwd")
    String pwd;
    @Attribute(attr_name = "idrole", attr_type = "integer")
    @Title(value = "idrole")
    Integer idrole;
    @Attribute(attr_name = "fullname", attr_type = "varchar(100)")
    @Title(value = "fullname")
    String fullname;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getLogin() {
        return login;
    }

    public void setLogin(Integer login) {
        this.login = login;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Integer getIdRole() {
        return idrole;
    }

    public void setIdRole(Integer idrole) {
        this.idrole = idrole;
    } 

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
}
