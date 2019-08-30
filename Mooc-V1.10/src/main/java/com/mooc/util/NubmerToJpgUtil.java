package com.mooc.util;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;

public class NubmerToJpgUtil {
	private static SimpleDateFormat sdf=new  SimpleDateFormat("yyyyMMddHHssmm");
	public static String NumberToJpgUtil(OutputStream outputStream) throws IOException{
		Random rd = new Random();
		BufferedImage img = new BufferedImage(140, 50, BufferedImage.TYPE_INT_BGR);
		Graphics g = img.getGraphics();
		g.setFont(new Font("宋体", Font.BOLD, 60));
		String number = String.valueOf(rd.nextInt(10000));
 		g.drawString(number, 10, 50);
		ImageIO.write(img, "jpg", outputStream);
		return number;
	}
	public static void deleteJpg(String url){
		File deletefile = new File(url);
		deletefile.delete();
	}
	public static void main(String[] args) throws IOException {
		//System.out.println(NumberToJpgUtil("1234"));
		/*deleteJpg("test1");*/
	}
}



