package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {

	String ruta="./src/log.txt";
	Calendar cal = Calendar.getInstance();
    File archivo = new File(ruta);
    BufferedWriter bw;
        ///Aspecto1: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    
    pointcut success() : call( void createUser());

    pointcut trans() : call( void makeTransaction() );

    pointcut retirado() : call( void myMoney() );

    after() : trans() {
    	System.out.println("**** Transaccion Realizada ****");
    	if(archivo.exists()) {
    	      try {
    	    	  bw = new BufferedWriter(new FileWriter(archivo.getAbsoluteFile(),true));
  	  	      	  bw.write("Transaccion realizada"+ cal.getTime());
  	  	      	  bw.append("\r\n");
  	  	      	  bw.close();

  		} catch (IOException e) {
  			e.printStackTrace();
  			}
      	} else {
    	      try {
    	    	  bw = new BufferedWriter(new FileWriter(archivo.getAbsoluteFile(),true));
  	  	      		bw.write("Transaccion realizada"+ cal.getTime());
  	  	      		bw.append("\r\n");
  	  	      		bw.close();
  		} catch (IOException e) {
  			e.printStackTrace();
  			}
      }
}
 
    after() : retirado() {
   	 
    	System.out.println("**** Dinero retirado ****");
    	if(archivo.exists()) {
    	      try {
    	    	  bw = new BufferedWriter(new FileWriter(archivo.getAbsoluteFile(),true));
    	  			bw.write("Dinero retirado"+ cal.getTime());
    	  			bw.append("\r\n");
  	      	bw.close();
  		} catch (IOException e) {
  			e.printStackTrace();
  			}
      	} else {
    	      try {
    	    	  bw = new BufferedWriter(new FileWriter(archivo.getAbsoluteFile(),true));
  	  	      		bw.write("Dinero retirado"+ cal.getTime());
  	  	      		bw.append("\r\n");
  	  	      		bw.close();
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
      	}
}
    
    after()  : success() {
    	System.out.println("**** User created ****"); 	 	
    }

    
}