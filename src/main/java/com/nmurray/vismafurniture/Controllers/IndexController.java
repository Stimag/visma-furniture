package com.nmurray.vismafurniture.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @RestController
    public class MyRestController {
        @RequestMapping("/")
        public ModelAndView welcome() {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("Index.html");
            return modelAndView;
        }
    }

}