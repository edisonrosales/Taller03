package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

public aspect Log {

	Calendar cal = Calendar.getInstance();
    File archivo = new File("./log.txt");
        ///Aspecto1: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    
    pointcut success() : call( void createUser(..) );

    pointcut trans() : call( void makeTransaction(..) );

    pointcut retirado() : call( void myMoney(..) );

    after() : trans() {
   	 
    	System.out.println("**** Transaccion Realizada ****");
}
    
    after() : retirado() {
   	 
    	System.out.println("**** Dinero retirado ****");
}
    
    after() : success() {
        	 
        	System.out.println("**** User created ****");
    }

    
}