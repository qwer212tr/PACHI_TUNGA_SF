--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]

quest mysterious_earthquakes begin
	state start begin
		when login or levelup or enter with pc.get_level() >=55 begin
			 set_state(information)
		end
	end

	state information begin
		when letter begin
			send_letter("&Depremlerin s�rr� ")
			local v=find_npc_by_vnum(20011)
			if 0==v then
			else
				target.vid("__TARGET__", v, "Uriel")
			end
		end
					
		when button or info begin
			say_title("Yongbi ��l� sars�nt�lar� ")
			say("")
			say("Uriel zor durumda! Git ve yapabilece�in bir")
			say("�ey var m� ��ren.")
		end

		when __TARGET__.target.click or 20011.chat."Depremlerin s�rr� " begin
			target.delete("__TARGET__")
			say_title("Yongbi ��l� sars�nt�lar� ")
			say("")
			say("Merhaba cesur sava���!")
			say("Nakajima ve �etesi son Yongbi ��l� ziyaretlerinde")
			say("ilgin� olaylar ya�am��lar. Anllatt�klar�na g�re")
			say("�r�mcek zindan� yak�nlar�na ula�t�klar� zaman")
			say("daha ileriye gidememi�ler. Sars�nt�lar o kadar")
			say("�iddetliymi�. D���nebiliyor musun? Son 20.000")
			say("y�ld�r bu topraklarda en ufak bir deprem bile")
			say("olmuyor!")
			wait()
			say_title("Yongbi ��l� sars�nt�lar� ")
			say("")
			say("Bu �ok ilgin�... Belki arkada��m Pung-Ho'ya benim")
			say("i�in bir ziyarette bulunabilirsin. Kendisi �r�mcek")
			say("zindan�nda ya��yor ve ger�ekten �ok sevdi�im bir")
			say("dostum. Bu deprem hikayelerini duyduktan sonra")
			say("onun i�in �ok endi�eleniyorum. Umar�m bir �ey")
			say("olmam��t�r. Bunu benim i�in yapar m�s�n?")
			say("Kar��l���nda seni �d�llendirece�im.")
			say("")
			local acceptq=select("Evet", "Hay�r")
			if acceptq == 1 then
				say_title(pc.get_name()..":")
				say("")
				say("Uriel ad�na �z�ld�m. Ona yard�m etmeliyim.")		
				say("")
				say_reward("Ge�i� bileti kazand�n.")
				pc.give_item2(71095, 1)
				set_state(accept)		
			elseif acceptq == 2 then
				say_title(pc.get_name()..":")
				say("")
				say("Kendimi tehlikeye atmak istemiyorum.")		
				say("�zg�n�m ama bunu yapamam.")
				say("")
				wait()
			end		
		end		
	end	
		
	state accept begin
		when letter begin
			send_letter("&Depremlerin s�rr� ")
			local x=find_npc_by_vnum(20089)
			if 0==x then
			else
				target.vid("__TARGET2__", x, "Pung-Ho")
			end
		end
			
		when button or info begin
			say_title("Yongbi ��l� sars�nt�lar� ")
			say("")
			say("�r�mcek zindan�na git ve Pung-Ho hayatta m� ")
			say("��ren. Daha sonra durumunu Uriel'e bildir.")
			say("")
			wait()
		end
			
		when 20011.chat."Yongbi ��l� sars�nt�lar� " begin		
			say_title("Uriel:")		
			say("")		
			say("Ne bu kadar erken mi d�nd�n?")		
			say("...")
			say("Ah... Depremlerden �ok korktun ve fikrini")
			say("de�i�tirdin de�il mi?")
			say("")
			say_reward("G�revi iptal etmek istiyor musun?")
			say("")
			local tooweak=select("Evet", "Hay�r")		
			if tooweak == 2 then		
				say_title("Uriel:")		
				say("")				
				say("Bana yard�m etti�in i�in �ok te�ekk�r ederim.")
				say("Acele et! Onun ba��na bir �ey gelmesinden")
				say("korkuyorum.")		
				say("")		
			else		
				say_title("Uriel:")		
				say("")				
				say("Korkular�n� anl�yorum fakat bu bir �l�m kal�m")
				say("meselesi! Senden ba�kas�na g�venemem. Tek")		
				say("umudum sensin!")
				say("")		
				local tooweak2=select("Peki, bunu yapaca��m!", "�zg�n�m ama yapamam.")		
				if tooweak2 == 1 then	
					say_title("Uriel:")
					say("")		
					say("�ok te�ekk�r ederim. �yi �anslar!")
					say("")
					wait()
				elseif tooweak2 == 2 then
					say_title(""..pc.get_name()..":")
					say("")		
					say("�r�mcek zindan�na yakla�t���mda sars�nt�lar")
					say("beni �ok korkuttu. �ok �zg�n�m ama bunu")
					say("yapamam.")
					say("")
					say_reward("G�rev ba�ar�s�z.")
					say("")		
					set_state(__FAILURE__)		
				end		
			end		
		end
	
		when __TARGET2__.target.click or 20089.chat."Pung-Ho, iyi misin?" begin
			target.delete("__TARGET2__")
			say_title("Pung-Ho:")
			say("")
			say("Merhaba sana nas�l yard�m edebilirim?")
			say("...")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say("Ah, Seni Uriel g�nderdi ��nk� benim i�in")
			say("endi�elendi �yle mi? Hahaha, Eski dostum Uriel!")
			say("Ona endi�elenmemesini s�yle. Bu zindan�n duvarlar� ")
			say("kaya gibi!")
			say("")
			wait()
			say_title("Pung-Ho:")
			say("")
			say("Depremlerin nedenini merak ediyor musun?")
			say("Pekala, sana daha sonra anlat�r�m. �imdi Uriel'e")
			say("d�n ve benim turp gibi oldu�umu s�yle!")
			say("")
			wait()
			set_state(back_to_uriel)
		end
	end
	
	state back_to_uriel begin
		when letter begin
			send_letter("&Uriel'e d�n")
			local u=find_npc_by_vnum(200811)
			if 0==u then
			else
				target.vid("__TARGET3__", u, "Uriel")
			end
		end
			
		when button or info begin
			say_title("Uriel'e d�n")
			say("")
			say("Uriel'e d�n ve g�zel haberi ona ver!")
			say("")
		end
			
		when __TARGET__.target.click or 20011.chat."Pung Ho'nun durumu hakk�nda" begin
			target.delete("__TARGET__")
			say_title(""..pc.get_name()..":")
			say("")
			say("Endi�elenmene gerek yok Uriel!")
			say("Pung-Ho �ok iyi durumda. �r�mcek zindan� ")
			say("onun g�venli�i i�in yeterince sa�lam.")
			say("")
			wait()
			say_title("Uriel:")
			say("")
			say("Oh! Bana yard�m etti�in i�in �ok te�ekk�r")
			say("ederim. Senin i�in k���k bir hediyem var.")
			say("")
			say_reward("10.000.000 Yang kazand�n.")
			say_reward("Elmas Matkap kazand�n.")
			say("")
			pc.change_money(10000000)
			pc.give_item2(81102, 1)
			clear_letter()		
			set_state(__COMPLETE__)
			q.done()
		end		
	end		
		
	state __COMPLETE__ begin		
	end		
	
	state __FAILURE__ begin		
	end		
end	