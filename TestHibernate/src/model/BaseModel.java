/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 *
 * @author amboa
 */
@MappedSuperclass
public class BaseModel {
    @Id
    @GeneratedValue
    int id;    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
