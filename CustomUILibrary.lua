-- CustomUILibrary.lua
local CustomUILibrary = {}

function CustomUILibrary:CreateWindow(options)
    local window = {}
    window.tabs = {}
    window.name = options.Name

    function window:MakeTab(tabOptions)
        local tab = {}
        tab.name = tabOptions.Name
        tab.buttons = {}
        tab.toggles = {}
        tab.dropdowns = {}

        function tab:AddButton(buttonOptions)
            local button = {}
            button.name = buttonOptions.Name
            button.callback = buttonOptions.Callback

            table.insert(tab.buttons, button)
        end

        function tab:AddToggle(toggleOptions)
            local toggle = {}
            toggle.name = toggleOptions.Name
            toggle.state = toggleOptions.Default
            toggle.callback = toggleOptions.Callback

            table.insert(tab.toggles, toggle)
        end

        function tab:AddDropdown(dropdownOptions)
            local dropdown = {}
            dropdown.name = dropdownOptions.Name
            dropdown.options = dropdownOptions.Options
            dropdown.callback = dropdownOptions.Callback
            dropdown.value = dropdownOptions.Default

            function dropdown:Refresh(newOptions, clear)
                if clear then
                    dropdown.options = {}
                end
                for _, option in pairs(newOptions) do
                    table.insert(dropdown.options, option)
                end
            end

            table.insert(tab.dropdowns, dropdown)
        end

        table.insert(window.tabs, tab)
        return tab
    end

    return window
end

return CustomUILibrary
