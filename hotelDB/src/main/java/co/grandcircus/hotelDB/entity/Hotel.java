package co.grandcircus.hotelDB.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "hotel_listing")
public class Hotel {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name= "hotel_id")
	private Long id;
	@Column(name= "hotel_name")
	private String name;
	@Column(name= "city")
	private String city;
	@Column(name= "rating")
	private Double rating;
	@OneToMany
	private List<Review> reviews;
	@Column(name= "price_per_night")
	private Integer price;
	
	
	
	public Hotel() {}

	public Double getRating() {
		return rating;
	}
	
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	

}
