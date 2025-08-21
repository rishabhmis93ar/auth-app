module com.iimt.auth {
	exports com.iimt.auth.utils;
	exports com.iimt.auth.filter;
	exports com.iimt.auth.dao;
	exports com.iimt.auth.servlets;
	exports com.iimt.auth.model;

	requires jakarta.servlet;
	requires java.sql;
	requires jbcrypt;
}