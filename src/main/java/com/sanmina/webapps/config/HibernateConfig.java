package com.sanmina.webapps.config;

import com.jolbox.bonecp.BoneCPDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Properties;


@Configuration
@EnableJpaRepositories(basePackages = {"com.sanmina.webapps.repository"})
@EnableTransactionManagement
@PropertySource("classpath:hibernate.properties")
public class HibernateConfig {

	  @Qualifier("environment")
	    @Autowired
	    private Environment env;

	    @Bean
	    public JpaTransactionManager transactionManager() {
	        EntityManagerFactory factory = entityManagerFactory().getObject();
	        return new JpaTransactionManager(factory);
	    }


	    @Bean
	    public DataSource dataSource() {
	        BoneCPDataSource dataSource = new BoneCPDataSource();
	        dataSource.setDriverClass(env.getProperty("db.driver"));
	        dataSource.setJdbcUrl(env.getProperty("db.url"));
	        dataSource.setUsername(env.getProperty("db.username"));
	        dataSource.setPassword(env.getProperty("db.password"));
	        
	        
	        //dataSource.setIdleConnectionTestPeriodInMinutes(240);
	        //dataSource.setIdleMaxAgeInMinutes(60);
	        //dataSource.setMaxConnectionsPerPartition(35);
	        //dataSource.setMinConnectionsPerPartition(1);
	        //dataSource.setPartitionCount(2);
	        //dataSource.setAcquireIncrement(5);
	        //dataSource.setStatementsCacheSize(100);
	        
	        return dataSource;
	    }

	    @Bean
	    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
	        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();

	        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
	        vendorAdapter.setShowSql(env.getProperty("hibernate.show_sql", Boolean.class));

	        factory.setDataSource(dataSource());
	        factory.setJpaVendorAdapter(vendorAdapter);
	        factory.setPackagesToScan("com.sanmina.webapps.entity");

	        Properties jpaProperties = new Properties();
	        jpaProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
	        jpaProperties.put("hibernate.ejb.naming_strategy", env.getProperty("hibernate.ejb.naming_strategy"));
	        jpaProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
	        
	        //jpaProperties.put("hibernate.c3p0.min_size", 5);
	        //jpaProperties.put("hibernate.c3p0.max_size", 20);
	        //jpaProperties.put("hibernate.c3p0.timeout", 300);
	        //jpaProperties.put("hibernate.c3p0.max_statements", 50);
	        //jpaProperties.put("hibernate.c3p0.idle_test_period", 3000);
	        factory.setJpaProperties(jpaProperties);

	        return factory;
	    }
}
