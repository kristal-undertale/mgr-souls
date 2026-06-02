local Assets, super = HookSystem.hookScript(Assets)

function Assets.getTexture(path)
    return _G.Assets.data.texture[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getTexture(path)
end

function Assets.getTextureData(path)
    return _G.Assets.data.texture_data[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getTextureData(path)
end

function Assets.getFrames(path)
    return _G.Assets.data.frames[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getFrames(path)
end

function Assets.getFrameIds(path)
    return _G.Assets.data.frame_ids[Mod.libs["mgr-souls"]:assetsMonsterSoulCheckOverwrite(path)] or super.getFrameIds(path)
end

return Assets
