package com.instinctools.domain.service;

import java.util.List;

import com.instinctools.model.UserPrincipal;



public interface UserService {
	
	 // ����������� ������������ �� �����
	 UserPrincipal getUser(String login, String password);
	 
	 //���������� ������������ �� ��
	 UserPrincipal getUserByID(Long userId);
	 
	 //���������� ������������ �� �����
	 UserPrincipal getUserByName(String name);
	 
	 // ����� ���������� ������ ���� ��������
	 List<UserPrincipal> getUsers();
     
		 
	 // ���������� ��������� ���������� �� �������� �� �������
	 void saveUser(UserPrincipal user);



}
