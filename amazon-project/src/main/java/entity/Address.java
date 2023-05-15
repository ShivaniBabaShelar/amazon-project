package entity;

public class Address {
	String name,mobile,country,city,state,landMark,area;

	public Address(String name, String mobile, String country, String city, String state, String landMark,
			String area) {
		super();
		this.name = name;
		this.mobile = mobile;
		this.country = country;
		this.city = city;
		this.state = state;
		this.landMark = landMark;
		this.area = area;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getLandMark() {
		return landMark;
	}

	public void setLandMark(String landMark) {
		this.landMark = landMark;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "Address [name=" + name + ", mobile=" + mobile + ", country=" + country + ", city=" + city + ", state="
				+ state + ", landMark=" + landMark + ", area=" + area + "]";
	}
}
