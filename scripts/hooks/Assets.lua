local Assets, super = HookSystem.hookScript(Assets)
-- i had to add the Mod global checks becase my game started crashing for some reason

function Assets.getTexture(path)
    if not Mod then return end
    return _G.Assets.data.texture[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getTexture(path)
end

function Assets.getTextureData(path)
    if not Mod then return end
    return _G.Assets.data.texture_data[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getTextureData(path)
end

function Assets.getFrames(path)
    if not Mod then return end
    return _G.Assets.data.frames[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getFrames(path)
end

function Assets.getFrameIds(path)
    if not Mod then return end
    return _G.Assets.data.frame_ids[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getFrameIds(path)
end

return Assets
