/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hellospring;

import model.Employe;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author amboa
 */
public class HelloSpring {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
        Employe emp = context.getBean("emp", Employe.class);
        System.out.println(emp.getAge());
        Employe.setAge(10);
        System.out.println(emp.getAge());
    }
    
}
