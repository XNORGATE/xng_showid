ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ggg')
AddEventHandler('ggg', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local _target = target
	local tPlayer = ESX.GetPlayerFromId(_target)

     
    MySQL.Async.fetchAll('SELECT * FROM users',
 {
	
 }, function (result)
	for i=1, #result, 1 do
	   local xPlayer1 = ESX.GetPlayerFromIdentifier(result[i].identifier)
		if xPlayer1 then
			TriggerClientEvent('ggg:showAnim', _source)
			Wait(2000)
			TriggerClientEvent('esx:showAdvancedNotification',_target ,'市政府' ,'身分證' ,'📃名字:'..result[i].name..'\n🌈生日:'..result[i].dateofbirth..'\n👨‍🦲性別:'..result[i].sex..'\n🔰職業:'..result[i].job ,'CHAR_HUMANDEFAULT' , 3)					
			Wait(10)
	    end
    end
   end)

end)

ESX.RegisterUsableItem('giveidentity', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)	
	TriggerClientEvent('linyun_giveidentity', source)
end)

