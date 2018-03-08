package com.sanmina.webapps.config;
import javax.servlet.Filter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.planetj.servlet.filter.compression.CompressingFilter;

@Configuration
public class AppConfig {

	//test
	@Bean
	public Filter compressingFilter() {
	    CompressingFilter compressingFilter = new CompressingFilter();
	    return compressingFilter;
	}
	
}
