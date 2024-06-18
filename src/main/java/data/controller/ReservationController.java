package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
   
   @GetMapping("/find/reservation")
   public ModelAndView booking() {
      ModelAndView model = new ModelAndView();
      
      model.setViewName("/find/reservation");
      return model;
   }
   
   @PostMapping("/find/reservationInfo")
   public ModelAndView insert() {
      ModelAndView model = new ModelAndView();

      model.setViewName("/find/reservation_success");
      return model;
   }
   

}
