package products;

import java.io.Serializable;

public class Laptop extends Product implements Serializable{

	public Laptop(String name, String type,int price, String imageSrc, String productInfo) {
		super(name, type,price, imageSrc, productInfo);
		// TODO Auto-generated constructor stub
	}

}
