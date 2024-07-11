package sist.last.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ComponentScan({"data.*"})
@MapperScan({"data.mapper"})
@EnableScheduling // 스케줄링 기능 활성화
public class TripNestFinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TripNestFinalProjectApplication.class, args);
	}

}