package oop0920;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Sungjuk_T {

	public static void main(String[] args) {
		// Q. 성적 프로그램
		// → 성적 입력 자료를(sungjuk.txt) 가져와서, 성적 결과파일을 완성하기(result.txt)
		/*
				1. 입력 데이터 파일 : sungjuk.txt
				
				2. 출력 데이터 파일 : result.txt
				
								성 / 적 / 결 / 과
              -------------------------------------------------------
              이름     국어   영어  수학   평균  등수   결과
              -------------------------------------------------------
			  라일락    100  100  100   100   1    합격 ********** 장학생
              진달래     50   55   60    55   4    불합격 *****
              개나리     95   95   35    75   3    재시험 *******
			  무궁화     80   85   90    85   2    합격 ********
              홍길동     60   40   30    43   5    불합격 ****
              ------------------------------------------------------
		 
		*/
		// 강사님 코드
		// → 문풀 : 엔터를 기준으로 한줄씩 불러와서 콤마를 기준으로 배열을 새로 만든다
		
		String inName = "I:/java202207/sungjuk.txt";
		String outName = "I:/java202207/result.txt" ;
		
		// input 
		FileReader     fr = null; 
		BufferedReader br = null;
		
		// output
		FileWriter   fw = null;
		PrintWriter out = null;
		
		
		try {
				// 1. 데이터를 저장 배열변수 선언
				String[] name = new String[5]; 
				int [] 	  kor = new int[5];
				int [] 	  eng = new int[5];
				int [] 	  mat = new int[5];
				int []   aver = new int[5];
				int []   rank = {1,1,1,1,1};
				
				int size = name.length; //5
				int i = 0; //반복용 
				
				// 2. 데이터 입력 파일(sungjuk.txt)에서 데이터 가져와서 읽기
			 	fr = new FileReader(inName);
				br = new BufferedReader(fr);	// 엔터단위로 한줄씩 리드
				
				while(true) {
					String line = br.readLine();	//"무궁화,95,90,100"
					if (line == null) {
						break;	
					}//if end
					System.out.println(line);
					
					// 3. ,콤마를 기준으로 문자열 분리 후 각 1단계에서 선언한 배열들에 저장한다
					String[] word = line.split(",");
					name[i] = word[0].trim();
					kor[i] = Integer.parseInt(word[1].trim());
					eng[i] = Integer.parseInt(word[2].trim());
					mat[i] = Integer.parseInt(word[3].trim());
					i++; //★ 그 다음 사람을 위해  i변수가 while문이 돌 동안 1씩 증가한다 
				}//while end
				
				// 4. (Q) 평균 구하기
				for(int a=0; a<size; a++) {
					aver[a] = (kor[a]+eng[a]+mat[a])/3;
				}
				 
				// 5. (Q) 등수 구하기 
			    for(int b=0; b<size; b++){
		               for(int j=0; j<size; j++){
		                   if(aver[b] < aver[j]){
		                       rank[b]=rank[b]+1;
		                   }
		               }
		        }
			     
			    /*
				///////////////////////////과락용 
				String [] pass  = new String[5];
				String [] star  = new String[5];
				String [] grade = new String[5];
			    
				// 패스논패스 
				for(int a=0; a<size; a++){
	               if(aver[a]>=70){
	                   if (kor[a]<40 || eng[a]<40 || mat[a]<40){
	                       pass[a] += "재시험";
	                   } else {pass[a] += "합　격";}
	               } else {pass[a] += "불합격";}
	            }
	         
				// 평균 10점당 *표 
	            for (int a=0; a<size; a++){
	                for(int n=0; n<(aver[a]/10); n++){
	                 star[a]+="*";
	                }
	             }
	            
	            // 장학생 (평균 95이상)
	            for(int a=0; a<size; a++){
	                if (aver[a]>=95){
	                    grade[a]+="장학생";
	                } else {grade[a]+="";}
	            }
	            
	            
	            
	            for(int a=0; a<size; a++) {
	            	System.out.println(pass[a]);
	            	System.out.println(star[a]);
	            	System.out.println(grade[a]);
	            }
			    */
			    
			    
			    
				// 6. result.txt 파일에 위 결과값 출력하기 
				fw = new FileWriter(outName, false);
				out = new PrintWriter(fw, true);
				
				out.println("　　　　　　　　　【 성 적 결 과 】　　　　　　　　　");
				out.println("------------------------------------------------------------------");
				out.println("이름     국어   영어  수학   평균  등수   결과");
				out.println("------------------------------------------------------------------");
				out.println("------------------------------------------------------------------");
				/*
				for(int a=0; a<size; a++) {
					out.println(	name[a]    + "　"
									+ kor[a]   + "　"
									+ eng[a]   + "　"
									+ mat[a]   + "　"
									+ aver[a]  + "　　　"
									+ rank[a]  + "　"
									+ pass[a]  + "　"
									+ star[a]  + "　"
									+ grade[a] + "　"
								);
				}
				*/
				
				for (i=0; i<size; i++) {
					out.printf("%-6s %5d %5d %5d %5d %5d　", name[i], kor[i], eng[i], mat[i], aver[i], rank[i]);
					
					// P/NP
					if (aver[i] >= 70) {
						if(kor[i]<40 || eng[i]<40 || mat[i]<40) {
							out.printf("%-10s", "재시험");
						} else {
							out.printf("%-10s", "합　격");
						}
					} else {
						out.printf("%-10s", "불합격");
					}//if end
					
					// *
					for(int star=0; star<=aver[i]/10; star++) {
						out.printf("%s","*");
					}
					
					
					// 장학생
					if (aver[i]>=95) {
						out.printf("%s","장학생");
					}
					
					out.println("  ");	//한사람 출력하고 줄바꿈 	
					
				}//for end
			
				out.println("------------------------------------------------------------------");
				out.println("------------------------------------------------------------------");
				
				

	           
	            
				
		} catch(Exception e) {
			
			System.out.println("파일 불러오기 실패 " + e);
			
		} finally {
					try {
						if(br != null) { br.close(); }
					} catch (Exception e) {}
					
					try {
						if(fr != null) { fr.close(); }
					} catch (Exception e) {}
					try {
						if(out != null) { out.close(); }
					} catch (Exception e) {}
					
					try {
						if(fw != null) { fw.close(); }
					} catch (Exception e) {}
		}//try end

	}//main() end
}//class end
