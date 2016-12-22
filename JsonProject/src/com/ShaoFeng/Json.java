package com.ShaoFeng;
import org.json.JSONArray;
import org.json.JSONObject;
public class Json {

	public static void main(String[] args) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObjectArray = new JSONObject();
		
		try {
			jsonObjectArray.put("id", "001");
			jsonObjectArray.put("name", "xiaoming");
			jsonObjectArray.put("age", "18");
			jsonArray.put(jsonObjectArray);
			jsonObject.put("content", jsonArray);
			System.out.println(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
