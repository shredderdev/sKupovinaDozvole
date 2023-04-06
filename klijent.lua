KupovinaDozvole = {
  {'csb_chef', 12.01, -1106.93, 28.8, 339.39},
}

Citizen.CreateThread(function()
  for _,v in pairs(KupovinaDozvole) do
    RequestModel(GetHashKey(v[1]))
    while not HasModelLoaded(GetHashKey(v[1])) do
      Wait(1)
    end
    PostaviPeda =  CreatePed(4, v[1],v[2],v[3],v[4],v[5], false, true)
    FreezeEntityPosition(PostaviPeda, true)
    SetEntityInvincible(PostaviPeda, true)
    SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
  end
end)

exports.qtarget:AddTargetModel({'csb_chef'}, {
    options = {
        {
          action = function() lib.showContext('otvoriMeni') end,
          icon = "fas fa-gun",
          label = "Kupi Dozvolu"
      },
  },
  distance = 3
})

lib.registerContext({
  id = 'otvoriMeni',
  title = 'Shredder Development - Kupovina Dozvole',
  options = {
    {
      title = 'Preuzmi Dozvolu',
      description = 'Dozvola kosta 20000$',
      event = 'platiDozvolu'
    },
    {
      title = 'Odustani',
      event = 'necu'
    },
  },
})

AddEventHandler('platiDozvolu', function()
  TriggerServerEvent('platiDozvolu')
end)

AddEventHandler("necu", function()
  ESX.ShowNotification("Odustali ste od kupovine dozvole za oruzije!")
end)
