local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local next = next
local hooksecurefunc = hooksecurefunc

function S:Blizzard_BindingUI()
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.binding) then return end

	local KB = _G.KeyBindingFrame
	for _, v in next, { 'defaultsButton', 'unbindButton', 'okayButton', 'cancelButton', 'quickKeybindButton' } do
		S:HandleButton(KB[v])
	end

	_G.KeyBindingFrameScrollFrame:StripTextures()
	S:HandleScrollBar(_G.KeyBindingFrameScrollFrameScrollBar)

	S:HandleCheckBox(KB.characterSpecificButton)
	KB.Header:StripTextures()
	KB.Header:ClearAllPoints()
	KB.Header:Point('TOP', KB, 'TOP', 0, -4)
	KB:StripTextures()
	KB:SetTemplate('Transparent')

	KB.categoryList.NineSlice:SetTemplate('Transparent')
	KB.bindingsContainer.NineSlice:SetTemplate('Transparent')

	for i = 1, _G.KEY_BINDINGS_DISPLAYED, 1 do
		local button1 = _G['KeyBindingFrameKeyBinding'..i..'Key1Button']
		local button2 = _G['KeyBindingFrameKeyBinding'..i..'Key2Button']
		button2:Point('LEFT', button1, 'RIGHT', 1, 0) -- Needed for new Pixel Perfect
	end

	hooksecurefunc('BindingButtonTemplate_SetupBindingButton', function(_, button)
		if not button.IsSkinned then
			local selected = button.selectedHighlight
			selected:SetTexture(E.media.normTex)
			selected:Point('TOPLEFT', 1, -1)
			selected:Point('BOTTOMRIGHT', -1, 1)
			selected:SetColorTexture(1, 1, 1, .25)
			S:HandleButton(button)

			button.IsSkinned = true
		end
	end)

	local Quick = _G.QuickKeybindFrame
	Quick:StripTextures()
	Quick:SetTemplate('Transparent')
	Quick.Header:StripTextures()

	for _, v in next, { 'okayButton', 'defaultsButton', 'cancelButton' } do
		S:HandleButton(Quick[v])
	end

	S:HandleCheckBox(Quick.characterSpecificButton)
end

S:AddCallbackForAddon('Blizzard_BindingUI')
