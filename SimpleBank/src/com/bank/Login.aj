package com.bank;

import java.io.File;
import java.util.Calendar;
import java.util.Scanner;

public aspect Login {
    //Aspecto2: El login debe realizarse antes de la transacci½n
	
	pointcut login(): call( void makeTransaction(..)) || call (void myMoney(..)) ;
	
	//private static Scanner input = new Scanner(System.in);

	before() : login(){
		System.out.println("***Validacion***");
		//String nombre= input.next("nombre:");
		//int id =Integer.valueOf(input.next("id"));
		
	}


/*
File file = new File("log.txt");
Calendar cal = Calendar.getInstance();
//Aspecto1: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
pointcut success() : call(* createUser() );
after() : success() {
	System.out.println("**** User created ****");
*/}