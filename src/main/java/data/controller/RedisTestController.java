package data.controller;

import data.service.redis.RedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
public class RedisTestController {

    private final RedisService redisService;

    @GetMapping("/redis")
    public String redis(String roomId) {
        redisService.addToSortedSet("viewRank", roomId);
        return "ok";
    }

    @GetMapping("/top")
    public String top() {
        return redisService.getTopRoomIds("viewRank").toString();
    }
}
