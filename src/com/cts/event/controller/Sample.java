package com.cts.event.controller;

import java.util.Date;

public class Sample {
	
	void r1(){
		System.out.println("Parent");
	}
	
	static void equal(){		
		String z="d";
		String y="d";
		System.out.println(z==y);		
	}	
	static void date(){
		Date d1 = new Date();
		Date d2 = new Date("10/08/2014");
		System.out.println(d2);
		
		System.out.println(d1.after(d2));
	}
	public static void main(String arg[]){		
		date();
	}

}

class Girl {
	  private int age;
	  Girl(int age) {
	    this.age = age;
	  }
	  public boolean willGoOutWithGuy(boolean isGuyUgly) {
	    return (age >= 22) && (!isGuyUgly);
	  }
	}

	class Guy {
	  private Girl girl = new Girl(2);
	  private boolean isUgly = false;
	  public boolean willGirlGoOutWithMe() {
	    return girl.willGoOutWithGuy(isUgly);
	  }
	  // Guy doesn't have access to Girl's age. but he can ask her out. 
	}