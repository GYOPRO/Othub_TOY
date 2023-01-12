package com.example.naverai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

import comment.CommentDAO;
import community.CommunityDAO;
import member.MemberDAO;
import report.ReportDAO;
import showroom.ShowroomDAO;


@SpringBootApplication
@ComponentScan
@ComponentScan(basePackages = "controller") 
@ComponentScan(basePackages = "member")
@ComponentScan(basePackages = "community")
@ComponentScan(basePackages = "comment")
@ComponentScan(basePackages = "pose")
@ComponentScan(basePackages = "object")

@ComponentScan(basePackages = "admin")
@ComponentScan(basePackages = "showroom")
@ComponentScan(basePackages = "product")
@ComponentScan(basePackages = "order")
@ComponentScan(basePackages = "shop")
@ComponentScan(basePackages = "productdetail")
@ComponentScan(basePackages = "cart")
@ComponentScan(basePackages = "pose2")
@ComponentScan(basePackages = "chatbot")
@ComponentScan(basePackages = "cs")
@ComponentScan(basePackages = "reserv")
@ComponentScan(basePackages = "csanswere")
@ComponentScan(basePackages = "review")
@ComponentScan(basePackages = "partner")
@ComponentScan(basePackages = "adproduct")
@ComponentScan(basePackages = "report")

@MapperScan(basePackageClasses = MemberDAO.class)
@MapperScan(basePackageClasses = CommunityDAO.class)
@MapperScan(basePackageClasses = CommentDAO.class)
@MapperScan(basePackageClasses = ShowroomDAO.class)
@MapperScan(basePackageClasses = ReportDAO.class)
@MapperScan(basePackages = "shop")
@MapperScan(basePackages = "productdetail")
@MapperScan(basePackages = "order")
@MapperScan(basePackages = "cart")
@MapperScan(basePackages = "reserv")
@MapperScan(basePackages = "pose2")
@MapperScan(basePackages = "partner")

public class NaveraiApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(NaveraiApplication.class, args);
	}
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(NaveraiApplication.class);
	}
}
