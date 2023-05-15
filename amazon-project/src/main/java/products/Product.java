package products;

public class Product {
	String name;
	String type;
	int price;
	String imageSrc;
	String productInfo;
	
	public Product(String name, String type, int price, String imageSrc, String productInfo) {
		super();
		this.name = name;
		this.type=type;
		this.price = price;
		this.imageSrc = imageSrc;
		this.productInfo = productInfo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImageSrc() {
		return imageSrc;
	}
	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Product [name=" + name + ", type=" + type + ", price=" + price + ", imageSrc=" + imageSrc
				+ ", productInfo=" + productInfo + "]";
	}

	
	
}
