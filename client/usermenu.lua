

        Citizen.CreateThread(function ()
            while true do
                Citizen.Wait(0)
                local ped = GetPlayerPed(-1)
                if(IsControlJustPressed(0,167))then
                    Hitmenu()
                end
            end
        end)

        ESX = nil 
        Citizen.CreateThread(function() 
        while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0) 
        end 
        end)

        function Hitmenu()
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
            title = "User Menu",
            align = "right",
                elements = {
                    {label = "FPS", value='Kera'},
                    {label = "Tag / Nacht", value='Kera2'},
                    {label = "Funktionen", value='Kera3'},
                }
            }, function (data, menu)
                ESX.UI.Menu.CloseAll()
                if data.current.value == 'Kera' then
                    Hitmarker4()
                end
                if data.current.value == 'Kera2' then
                    Hitmarker3()
                end
                if data.current.value == 'Kera3' then
                    Hitmarker2()
                end
                if data.current.value == 'Kera4' then
                    Hitmarker1()
                end      
            end,    
            function (data, menu) 
            menu.close()   
            end)
    end

    function Hitmarker1()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title = "Hitmarker",
        align = "right",
            elements = {
                {label = "Rot", value='Kera12'},
                {label = "Grün", value='Kera13'},
                {label = "Orange", value='Kera14'},
                {label = "Geld", value='Kera15'},
            }
        }, function (data, menu)
            ESX.UI.Menu.CloseAll()
                if data.current.value == 'Kera12' then
                    ExecuteCommand("red")
                end
                if data.current.value == 'Kera13' then
                    ExecuteCommand("green")
                end 
                if data.current.value == 'Kera14' then
                    ExecuteCommand("orange")
                end   
                if data.current.value == 'Kera15' then
                    ExecuteCommand("yellow")
                end   
        end, 
        function (data, menu) 
            menu.close()     
        end)
end

    function Hitmarker2()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title = "Funktionen",
        align = "right",
            elements = {
                {label = "Selbstmord", value='Kera10'},
                {label = "Skinmenu", value='Kera11'},
                {label = "FFA Menu", value='Kera12'},
                {label = "Aufsätze", value='Kera13'},
                {label = "Funkanimation", value='Kera14'},
                {label = "Teleport Menu", value='Kera15'},
            }
        }, function (data, menu)
            ESX.UI.Menu.CloseAll()
                if data.current.value == 'Kera10' then
                    ExecuteCommand("die")
                end
                if data.current.value == 'Kera11' then
                    ExecuteCommand("skin")
                end  
                if data.current.value == 'Kera12' then
                    ExecuteCommand("ffa")
                end
                if data.current.value == 'Kera13' then
                    ExecuteCommand("atts")
                end
                if data.current.value == 'Kera15' then
                    ExecuteCommand("fett")
                end
                if data.current.value == 'Kera14' then
                    ExecuteCommand("funk")
                end
        end, 
        function (data, menu) 
            menu.close()     
        end)
end

    function Hitmarker3()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title = "Tag / Nacht",
        align = "right",
            elements = {
                {label = "Tag", value='Kera7'},
                {label = "Nacht", value='Kera8'},
            }
        }, function (data, menu)
            ESX.UI.Menu.CloseAll()
                if data.current.value == 'Kera7' then
                    ExecuteCommand("day")
                end
                if data.current.value == 'Kera8' then
                    ExecuteCommand("night")
                end 
        end, 
        function (data, menu) 
            menu.close()     
        end)
end

    function Hitmarker4()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title = "FPS",
        align = "right",
            elements = {
                {label = "FPS ON", value='Kera6'},
                {label = "FPS OFF", value='Kera7'},
            }
        }, function (data, menu)
            ESX.UI.Menu.CloseAll()
                if data.current.value == 'Kera6' then
                    ExecuteCommand("fps")
                end
                if data.current.value == 'Kera7' then
                    ExecuteCommand("fpsoff")
                end  
        end, 
        function (data, menu) 
            menu.close()     
        end) 
    end