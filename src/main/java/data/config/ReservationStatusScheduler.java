package data.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import data.service.ReservationService;

@Component
public class ReservationStatusScheduler {

	@Autowired
	ReservationService reservationService;
	
	@Scheduled(cron = "0 15 18 * * ?") // 매일 오후 6시 15분에 실행
    public void updateReservationStatus() {
        reservationService.updateReservationStatus();
        System.out.println("예약 상태 업데이트 실행");
    }
}
