package data.service;

import data.dto.LoginDto;
import data.dto.MemberDto;

public interface LoginServiceInter {
    MemberDto authenticate(LoginDto loginDto);
}
