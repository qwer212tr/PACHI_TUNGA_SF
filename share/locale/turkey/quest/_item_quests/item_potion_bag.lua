--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest item_potion_bag begin
	state start begin
		when 30145.use begin
			if pc.count_item(item.get_vnum()) < 1 then
				say_title("�ksir �antas� ")
				say("")
				say_reward("Envanterinde iksir �antas� bulamad�m.")
			else
				say_size(300,350)
				say_title("�ksir �antas� ")
				say("")
				say("Yoldam� kald�n ? Merak etme ben buraday�m...")
				say_reward("Hangi iksirden istiyorsun ?")
				local s = select("Ye�il �ksir (B)","Mor �ksir (B)","K�rm�z� �ksir (B)","Mavi �ksir (B)","Vazge� ")
				local cost = 0
				local count = 1
				if s == 1 then -- Yesil Iksir B
					cost = 300000
					count = 200
				elseif s == 2 then -- Mor Iksir B
					cost = 300000
					count = 200
				elseif s == 3 then
					cost = 32000
					count = 200
				elseif s == 4 then
					cost = 96000
					count = 200
				end
				if pc.get_gold() < cost then
					say_title("�ksir �antas� ")
					say("")
					say_reward("Yeterli Yang'a sahip de�ilsin.")
				elseif pc.get_empty_inventory_count() < 1 then
					say_title("�ksir �antas� ")
					say("")
					say_reward("Envanterinde yeterli bo� yer bulamad�m.")
				else
					pc.change_gold(-cost)
					if s == 1 then
						pc.give_item2(27102, count)
						syschat(string.format("%s �simli e�ya envanterine eklendi. Kar��l���nda %s Yang kaybettin.",item_name(27102), cost))
					elseif s == 2 then
						pc.give_item2(27115, count)
						syschat(string.format("%s �simli e�ya envanterine eklendi. Kar��l���nda %s Yang kaybettin.",item_name(27115), cost))
					elseif s == 3 then
						pc.give_item2(27003, count)
						syschat(string.format("%s �simli e�ya envanterine eklendi. Kar��l���nda %s Yang kaybettin.",item_name(27115), cost))					
					elseif s == 4 then
						pc.give_item2(27006, count)
						syschat(string.format("%s �simli e�ya envanterine eklendi. Kar��l���nda %s Yang kaybettin.",item_name(27115), cost))					
					end
				end
			end
		end
	end
end