package com.smhrd.recycle;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	
		@RequestMapping(value = "/quiz", method = RequestMethod.GET)
		public String quiz() {
			
			return "quiz";
	}
	
		@RequestMapping(value = "/material", method = RequestMethod.GET)
		public String material() {
			
			return "material";
	}
		
		@RequestMapping(value = "/item", method = RequestMethod.GET)
		public String item() {
			
			return "item";
	}
		
		@RequestMapping(value = "/index", method = RequestMethod.GET)
		public String index() {
			
			return "index";
	}
}
