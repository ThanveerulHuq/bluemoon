package com.sdms.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;



@Configuration
@EnableWebMvc
@ComponentScan("com.sdms.controller")
public class WebConfig  extends WebMvcConfigurerAdapter {

	@Bean
    UrlBasedViewResolver setupViewResolver() {
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();
        resolver.setPrefix("/views/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
        return resolver;
    }
	
	@Bean
	CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
//	    resolver.setMaxUploadSize(10485760);
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
//    	registry.addViewController("").setViewName("homePage");
//        registry.addViewController("login").setViewName("login");
//        registry.addViewController("homePage").setViewName("homePage");
//        registry.addViewController("_headerIncludes").setViewName("shared/_headerIncludes");
//        registry.addViewController("_footerIncludes").setViewName("shared/_footerIncludes");
//        registry.addViewController("_header").setViewName("shared/_header");
//        registry.addViewController("_footer").setViewName("shared/_footer");
//        registry.addViewController("notification").setViewName("notification");
//        registry.addViewController("notesNotification").setViewName("notesNotification");
        super.addViewControllers(registry);
    }

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/").setCachePeriod(Integer.MAX_VALUE);
		super.addResourceHandlers(registry);
	}

//	@Override
//	public void configureHandlerExceptionResolvers(
//			List<HandlerExceptionResolver> exceptionResolvers) {
//		ExceptionsHandler eh= new ExceptionsHandler();
//		exceptionResolvers.add(eh);
//		super.configureHandlerExceptionResolvers(exceptionResolvers);
//	}
//    
}
