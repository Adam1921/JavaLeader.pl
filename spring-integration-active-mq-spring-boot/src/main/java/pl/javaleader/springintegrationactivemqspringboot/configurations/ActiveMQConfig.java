package pl.javaleader.springintegrationactivemqspringboot.configurations;

import org.apache.activemq.command.ActiveMQQueue;
import javax.jms.Queue;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ActiveMQConfig {
    @Bean
    public Queue javaLeaderQueue() {
        return new ActiveMQQueue("javaLeaderQueue");
    }
}