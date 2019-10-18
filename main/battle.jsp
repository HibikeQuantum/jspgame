<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
	변수 처리
	쿼리 to 몬스터 테이블 (맵번호, 몬스터 전체 테이블)
	테이블 중 등장확률을 다 더해서 radom_max_value를 지정하고
	실제로 그값을 기준으로 0~radom_max_value 돌린다.
	ResultSet rs = stmt.executeQuery("SELECT * FROM test_tbl");
        rs.last();      
        int rowcount = rs.getRow();
        rs.beforeFirst();
	그 다음 임시값 cur_mon 값을 올려가면서 
	value_min = 0;
	emerge_lotto = rand - 
	)
	for (cur_mon=0; cur_mon < rowcount);curmon++)
	{
		vlalue_min = vlaue_max
		valuex_max = value_min + rs.getInt(emerge_rate))	
		
		if (value_min <= lotto_value) && (lotto_value <=value_max) 
			result_mon_number = cur_mon
			break;
			rs.next();			
	}
	cha_code = rs.getint(cha_code);
	battle_object fighter1 = new battle_object(cha code);
	battle_object fighter2 = new battle_object(player code);
	
	boolean battle_over_boolean;
	while(1){
		act_point1 = 0;
		act_point2 = 0;
		act_chance1 = 0;
		act_chance2 = 0;
		
		int turn =0; 
		battle - 리프레시 호출
		 
		공격순서 정하기
		while(act_boolean){
			turn++;
			fighter1.act_get(); 
			fighter2.act_get();
			
			while(act_check){
				act_check = 0;
				if(fighter1.act_view>=1){
				fighter1.act_down();
				act_chance1++;
				}
				if(fighter2.act_view>=1){
				fighter2.act_down();
				act_chance2++;
				}
				if(fighter1.act_view >=1 || fighter2.act_view >=1){
				act_check = 1;
				}
			}
		}
		스킬발동 정하기
		
		while(skill_boolean){
			fighter1.skill_phase;	//스킬방동여부 판단 완료
			fighter2.skill_phase;	// if 씌우고 스킬발동 방해활동 스킬 구현가능
			if(fight1.DoubleStrikeOn){
				damage = fighter2.공격력 * 2
				print(fighter2, "DoubleStrike");
			//"fighter2 가 DoubleStrike(으)로 'damage'만큼의 데미지를 줬습니다."
				fight2.hp_diff(fight2)
			}
		}
		승부판정
		over_check();
		if(battle_over_boolean==false){
			break;
		}
		
		
		평타페즈
		while(attack_boolean){
			print(fight1, attack);
			fight2.hp_diff(fight2)
		}
		승부판정
		over_check();
		if(battle_over_boolean==false){
			break;
		}
	}
	// 재도전, 마을가기 - html 보여주기
		

		public boolean over_check{
			if ( fighter1.hpp_view <= 0 )|| fighter2.hpp_view <= 0){
				if (fighter1.hp_view = fighter2.hpp_view) {
					print("헉 무승부");
				if (fighter1.hp_view > if (fighter2.hp_view){
					battle_over_boolean = false;
					printf("몬스터 잡았습니다.")	
					getMonsterResult(fighter2.code);
				}
				if (fighter1.hp_view < if (fighter2.hp_view){
					battle_over_boolean = false;
					printf("몬스터에게 당했습니다. 기절!")	
					
				}
			}				
			
			
		public boolean getMonsterResult(int code)
			if ()	{
				//골드
				//경험치
				//아이템드랍
				
			}
</body>
</html>
