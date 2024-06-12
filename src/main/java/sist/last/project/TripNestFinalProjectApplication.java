package sist.last.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*"})
@MapperScan({"data.mapper"})
public class TripNestFinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TripNestFinalProjectApplication.class, args);
	}

}
