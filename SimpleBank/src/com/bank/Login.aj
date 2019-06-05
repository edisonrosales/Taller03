package com.bank;

import java.util.Scanner;

public aspect Login {
	String nombre;
	int clave;
	pointcut login(): call( void makeTransaction(..)) || call (void myMoney(..)) ;
	

	before() : login(){
		Scanner input = new Scanner(System.in);
		System.out.println("***Validacion***");
		System.out.println("Usuario");
		nombre = input.nextLine();
		System.out.println("Contraseña");
		clave = input.nextInt();
	}
}