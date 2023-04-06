RegisterServerEvent('platiDozvolu')
AddEventHandler('platiDozvolu', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local proveriStanje = xPlayer.getAccount('money').money
    local mozdaIma = xPlayer.getInventoryItem('oruzije')
    if proveriStanje < 20000 then 
		xPlayer.showNotification("Nemate dovoljno novca")
		return
	else
	if mozdaIma.count > 0 then
  	    xPlayer.showNotification("Vec imas dozvolu za oruzije")
  	    return
  	end
  	--TriggerClientEvent('okokNotify:Alert', source, "NEO", "Kupili ste dozvolu za oruzije!", 5000, 'success')
	xPlayer.showNotification("Kupili ste dozvolu za oruzije!")

  	--daje vama
	TriggerEvent('esx_license:addLicense', source, 'weapon')
	xPlayer.addInventoryItem('oruzije', 1)
	xPlayer.removeMoney(20000)
  end
end)
