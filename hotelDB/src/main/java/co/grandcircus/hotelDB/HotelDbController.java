package co.grandcircus.hotelDB;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.hotelDB.entity.Hotel;
import co.grandcircus.hotelDB.entity.HotelDao;
import co.grandcircus.hotelDB.entity.Review;
import co.grandcircus.hotelDB.entity.ReviewDao;

@Controller
public class HotelDbController {
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		return new ModelAndView("index");
	}
	
	@RequestMapping("/results")
	public ModelAndView showResults(@RequestParam(name="rating", required=false) Double rating, @RequestParam(name="city", required=false) String city, @RequestParam(name="max", required=false) Integer max) {
		ModelAndView mv = new ModelAndView();
		List<Hotel> l = hotelDao.findByName(city);
		List<Hotel> list = new ArrayList<>();
		for(Hotel h : l) {
			if(h.getPrice() < max) {
				list.add(h);
			}
		}
		
		
		mv.addObject("max", max);
		mv.addObject("list", list);
		mv.addObject("city", city);
		
		return mv;
		
	}
	
	@PostMapping("/")
	public ModelAndView updateReview(@RequestParam(name="hotel", required=false) Long id, @RequestParam("rating") Double rating) {
		
		if(id == null) {
			return new ModelAndView("index");
		}
		
		Review r = new Review(rating, hotelDao.findById(id));
		reviewDao.createReview(r);
		Hotel h = hotelDao.findById(id);
		
		List<Review> list = reviewDao.findById(id);
		double review = 0;
		for (Review rev : list) {
			review = review + rev.getRating();
		}
		
		h.setRating(review/list.size());
		hotelDao.update(h);
		
		return new ModelAndView("index");
	}
	
	

}
