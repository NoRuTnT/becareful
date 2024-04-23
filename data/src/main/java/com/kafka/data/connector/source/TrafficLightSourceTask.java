package com.kafka.data.connector.source;
import java.util.List;
import java.util.Map;

import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.errors.ConnectException;
import org.apache.kafka.connect.source.SourceRecord;
import org.apache.kafka.connect.source.SourceTask;
import org.apache.kafka.connect.storage.OffsetStorageReader;


public class TrafficLightSourceTask extends SourceTask {

	@Override
	public String version() {
		// 버전 반환
		return "1.0";
	}
	@Override
	public void start(Map<String, String> props) {
		// 여기에 초기화 코드 작성
	}

	@Override
	public List<SourceRecord> poll() throws InterruptedException {
		// 데이터 추출 로직 구현
		return null;
	}

	@Override
	public void stop() {
		// 자원 정리 코드
	}

	//config 추가예정

}
