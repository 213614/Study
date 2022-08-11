/* myscript.js */ 
function hap(a, b){         // 두 수 사이의 합을 반환하시오
    //(2,5) 2+3+4+5 : 반대도 해야함
    let plus=0;  // 결과값

    if (a>=b){
        for (let i=b; i<=a; i++){
            plus+=i;
        }
    } else {
        for (let j=a; j<=b; j++){
            plus+=j;
        }
    }
    return plus;
}//hap() end

function diff(a, b){        // 두 수 사이의 차이를 반환하시오
    //(2,5)  값 : 3     | (5,2) 값 : 3  :빼기를 양수로 반환해서 (절대값math사용) Math.abs();
    let min=0;

    min+=Math.abs(a-b);

    return min;
}//diff() end

function leap(year){        // 윤년 평년을 반환하시오 
    if (year%4==0 && year%100!=0 || year%400==0) {
        return true;   
    } else {        
        return false;
    }
}//leap() end
