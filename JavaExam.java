package java_pjt;

import java.util.Random;

public class JavaExam {
	public static void main(String[] args) {
		int[][]array = new int [3][4];
		int rNum = 0;
		Random generator = new Random();
		
		
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				array[i][j] = generator.nextInt(10);
				rNum += array[i][j];
		
				System.out.print(array[i][j] + " ");
				
			}
			System.out.println();
		}
			System.out.println("합은"+rNum);
				
		}
	}
	
	

