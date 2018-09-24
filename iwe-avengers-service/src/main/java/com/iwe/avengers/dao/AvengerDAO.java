package com.iwe.avengers.dao;

import java.util.HashMap;
import java.util.Map;

import com.iwe.avenger.dynamodb.entity.Avenger;

public class AvengerDAO {
	
	private Map<String, Avenger> mapper = new HashMap<>();
	
	
	public AvengerDAO() {
		
		mapper.put("aaaa-bbbb-cccc-dddd", new Avenger("aaaa-bbbb-cccc-dddd","Captain America", "Steve Rogeres"));
		
		mapper.put("aaaa-aaaa-aaaa-aaaa", new Avenger("aaaa-aaaa-aaaa-aaaa","Hulk", "Bruce Banner"));
	}

	public Avenger search(String id) {
		
		return mapper.get(id);
	}

}
