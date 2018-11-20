package co.grandcircus.hotelDB;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.hotelDB.entity.Hotel;
import co.grandcircus.hotelDB.entity.HotelDao;

@Controller
public class HotelDbController {
	
	@Autowired
	HotelDao hotelDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		return new ModelAndView("index");
	}
	
	@RequestMapping("/results")
	public ModelAndView showResults(@RequestParam(name="city", required=false) String city, @RequestParam(name="max", required=false) int max) {
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

}
