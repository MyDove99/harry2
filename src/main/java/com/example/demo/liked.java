package com.example.demo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class liked {
    int boardnum;
    String nick;
    int liked;
}
