package data.service.redis;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
@RequiredArgsConstructor
public class RedisService {

    private final RedisTemplate<String, String> redisTemplate;

    public void addToSortedSet(String key, String roomId) {
        ZSetOperations<String, String> zSetOperations = redisTemplate.opsForZSet();
        Double score = zSetOperations.score(key, roomId);
        if (score == null)
            zSetOperations.add(key, roomId, 1);
        else
            zSetOperations.incrementScore(key, roomId, 1);
    }
    public Set<String> getTopRoomIds(String key) {
        ZSetOperations<String, String> zSetOperations = redisTemplate.opsForZSet();
        return zSetOperations.reverseRange(key, 0, 4);
    }

}
