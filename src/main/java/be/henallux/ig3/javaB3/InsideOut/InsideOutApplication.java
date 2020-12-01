package be.henallux.ig3.javaB3.InsideOut;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class InsideOutApplication {

	public static void main(String[] args) {
		SpringApplication.run(InsideOutApplication.class, args);
	}

}
