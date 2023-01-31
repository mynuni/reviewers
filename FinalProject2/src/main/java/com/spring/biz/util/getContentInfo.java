package com.spring.biz.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.spring.biz.movie.ContentsDetailVO;

public class getContentInfo {
	private final static String KEY = "f12f9b3cd2d170afcba68ce88803cbbb";
	private static String result = "";

	public ContentsDetailVO getjsonObjectInfo(String type, int movieID) {
		ContentsDetailVO vo = new ContentsDetailVO();

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = "0001-01-01";
		try {
			URL url = new URL(
					"https://api.themoviedb.org/3/" + type + "/" + movieID + "?api_key=" + KEY + "&language=ko");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			// 읽어온 Buffer 데이터를 readLine() 메소드를 사용해서 한줄씩 읽어 result변수에 저장
			result = bf.readLine();
			System.out.println(result.getClass().getName());
			/*
			 * 현재까지는 result에 저장되어 있는 값은 String타입이므로 json타입으로 인식하도록 바꾸기 위해서 JSON 관련 라이브러리를 사용
			 * JSONParser를 사용해서 String 값을 json 객체로 만들어준다.
			 */
			JSONParser jsonParser = new JSONParser();

			// 만들어진 JSON 객체는 JSONObject 사용해서 저장
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);

			// 만들어진 JSONObject에서 key가 total_pages인 value를 추출하기 위해서 get() 사용
			vo.setOverview(jsonObject.get("overview").toString());
			vo.setContents_num(Integer.parseInt(String.valueOf(jsonObject.get("id"))));
			vo.setContents_type(type);
			vo.setVote_average(Float.parseFloat(String.valueOf(jsonObject.get("vote_average"))));
			vo.setPopularity(Float.parseFloat(String.valueOf(jsonObject.get("popularity"))));

			if (type.equals("movie")) {

				// 영화일 경우 release_date를 key로 데이터 파싱
				if (jsonObject.get("release_date") == null || jsonObject.get("release_date").equals("")) {
					vo.setRelease_date(dateFormat.parse(date));
				} else {
					Date release_date = dateFormat.parse((String) jsonObject.get("release_date"));
					vo.setRelease_date(release_date);
				}
				vo.setTitle(jsonObject.get("title").toString());
				vo.setRuntime(jsonObject.get("runtime").toString());
			} else if (type.equals("tv")) {

				// 시리즈일 경우 first_air_date를 key로 데이터 파싱
				if (jsonObject.get("first_air_date") == null || jsonObject.get("first_air_date").equals("")) {
					vo.setRelease_date(dateFormat.parse(date));
				} else {
					Date first_air_date = dateFormat.parse((String) jsonObject.get("first_air_date"));
					vo.setRelease_date(first_air_date);
				}

				// 시리즈일 경우 title이 아닌 name을 key로 데이터 파싱
				vo.setTitle(jsonObject.get("name").toString());
			}
			if (jsonObject.get("poster_path") == null || jsonObject.get("poster_path").toString().equals("")) {
				vo.setPoster_path("");
			} else {
				vo.setPoster_path(jsonObject.get("poster_path").toString());
			}
			if (jsonObject.get("backdrop_path") == null || jsonObject.get("backdrop_path").toString().equals("")) {
				vo.setBackdrop_path("");
			} else {
				vo.setBackdrop_path(jsonObject.get("backdrop_path").toString());
			}

			JSONArray genre_list = (JSONArray) jsonObject.get("genres");

			List<String> list = new ArrayList<String>();
			if (genre_list.size() > 0) {
				for (int i = 0; i < genre_list.size(); i++) {
					JSONObject jsonObj = (JSONObject) genre_list.get(i);

					System.out.println((String) jsonObj.get("name"));
					list.add((String) jsonObj.get("name"));
				}

			}
			vo.setGenres(list);

			return vo;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

}
