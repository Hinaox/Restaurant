/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author amboa
 */
@Configuration
@ComponentScan(basePackages= {"model", "config", "dao", "service"})
public class SpringConfig {
    
    @Bean 
    SessionFactory sessionFactory() {
        org.hibernate.cfg.Configuration config = new org.hibernate.cfg.Configuration();
        config.configure("hibernate.cfg.xml");
        return config.buildSessionFactory();
    }
    
}
