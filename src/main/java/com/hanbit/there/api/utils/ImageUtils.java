package com.hanbit.there.api.utils;

/*
 * 서버에서 썸네일 만들어주는 thumbnailator 사용
 * 클라이언트에서 줄여서 서버로 보내려면 캔버스 사용하면 됨
 * */
import java.io.IOException;
import java.io.InputStream;

import net.coobird.thumbnailator.Thumbnails;

public class ImageUtils {

	// 폭, 높이
	public static void resize(InputStream inputStream, int width, int height, String targetFilePath)
			throws IOException {
		
		Thumbnails.of(inputStream).size(width, height).toFile(targetFilePath);
	}
	
	// 폭만
	public static void resize(InputStream inputStream, int width, String targetFilePath)
			throws IOException {
		
		Thumbnails.of(inputStream).width(width).toFile(targetFilePath);
	}
	
}
