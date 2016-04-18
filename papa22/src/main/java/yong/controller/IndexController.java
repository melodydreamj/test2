package yong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yong.index.indexDTO;

@Controller
public class IndexController {
	
		@Autowired
		private yong.index.indexDAO indexDAO;
		
		@RequestMapping("/index2.do")
		public ModelAndView index2(indexDTO dto){
			System.out.println("dto.getTokenSecret():"+dto.getTokenSecret());
			//int result = indexDAO.setDB(dto);
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", "Spring FrameWork MVC");
			mav.addObject("tokenSecret", dto.getTokenSecret());
			mav.addObject("token", dto.getToken());
			mav.setViewName("/index2");
			return mav;
			
		}
		
		@RequestMapping("/index.do")
		public ModelAndView index(indexDTO dto){
			System.out.println("index.do 시작 - dto.getTokenSecret():"+dto.getTokenSecret());
			//int result = indexDAO.setDB(dto);
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", "Spring FrameWork MVC");
			mav.addObject("tokenSecret", dto.getTokenSecret());
			mav.addObject("token", dto.getToken());
			mav.setViewName("/index");
			return mav;
			
		}

	}



