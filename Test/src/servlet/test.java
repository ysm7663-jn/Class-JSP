package servlet;

public class test {
	
	public static void main(String[] args) {
		
		for (int i = 2; i <= 5; i++) {
			for (int j = 1; j <= 9; j++) {
				if (j % 4 != 0) {
					System.out.println(i + " * " + j + " = " + (i * j) + "\t");
				}
			}
		}
		
	}

}
