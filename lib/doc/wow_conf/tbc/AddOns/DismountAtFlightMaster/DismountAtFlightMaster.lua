--------------------------------------
-- Dismount at Flight Master --
--------------------
-- Author: Icediamond
--------------------------------------


--- Event frame for opening and closing the taxi map.
CreateFrame("Frame", "TaxiOpenEventFrame", UIParent)
TaxiOpenEventFrame:RegisterEvent("TAXIMAP_OPENED")
TaxiOpenEventFrame:SetScript("OnEvent", function(self, event, ...)

	if ( event == "TAXIMAP_OPENED" ) then

		-- Check if mounted...

		if ( IsMounted() ) then

			-- Dismount!

			Dismount();

		end
		
	end
	

end)

