package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ImagesDto;
import data.dto.JournalDto;
import data.dto.PromotionDto;
import data.dto.RoomsDto;
import data.service.ImageService;
import data.service.JournalService;
import data.service.PromotionService;
import data.service.RoomsService;

@Controller
public class MainController {

   @Autowired
   JournalService journalService;

   @Autowired
   PromotionService promotionService;

   @Autowired
   RoomsService roomsService;

   @Autowired
   ImageService imageService;

   @GetMapping("/")
   public String start() {
      return "redirect:index";
   }

   @GetMapping("index")
   public ModelAndView index() {
      ModelAndView model = new ModelAndView();
      List<JournalDto> journalDto = journalService.dataList();
      List<PromotionDto> promotionDto = promotionService.dataList();
      List<RoomsDto> roomsDto = roomsService.dataList();
      List<ImagesDto> imageDto = imageService.dataList();
      model.addObject("journalDto", journalDto);
      model.addObject("promotionDto", promotionDto);
      model.addObject("roomsDto", roomsDto);
      model.addObject("imageDto", imageDto);
      model.setViewName("/main/index");
      return model;
   }

}
