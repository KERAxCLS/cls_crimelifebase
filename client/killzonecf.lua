KERAxCLS = {}

KERAxCLS.coords = {x = 285.3048, y = -590.1761, z = 43.2606} -- DRüCKE E UM ZU KILLZONE ZU GELANGEN

KERAxCLS.marker = { r = 227, g = 0, b = 0 } -- MARKER COLOR 

KERAxCLS.killzonesize = {x = 70.00, y = 70.00, z = 50.00} -- KILLZONE BUBBLE GRÖßE 955.8431, 30.3785, 120.2209, 325.1362

KERAxCLS.killzone = {
     coords =  vector3(955.8431, 30.3785, 120.2209),  -- KILLZONE BUBBLEs
        respawns = {
             vector3(952.7534, 75.7005, 113.5477),     --Random respawn coords
             vector3(987.9681, 78.1825, 111.2216),     --Random respawn coords
             vector3(992.6497, 53.9407, 111.3482),     --Random respawn coords
             vector3(939.6541, -1.9646, 111.3005),     --Random respawn coords
             vector3(923.4482, -0.5702, 111.2894),     --Random respawn coords
             vector3(905.5411, 34.2210, 111.3268),     --Random respawn coords
             vector3(934.5538, 14.7806, 112.5340),
            -- vector3(1256.2697, -538.2219, 68.9263), -- SO EINFÜGEN

          },

        respawntime =  3 ,  --ZEIT BIS MAN RESPAWNT
        revtrigger =  'esx_ambulancejob:revive',  --DEIN REVIVE TRIGGER

     }