-- make a database that is clear from the start and takes user input
local list = {}
print("Enter your choice for the database, or type 'END' to exit")
while true do
    local input = io.read()
    if input == "END" then
        print("Input ended.")
        break
    elseif input == "" then
        print("Empty input, please enter a valid choice.")
    elseif input == "SAVE" then
        print("Current database entries:")
        for i, v in ipairs(list) do
            print(i, v)
        end
    elseif input == "REMOVE" then
        print("Enter the number of the entry to be removed")
        local removeIndex = tonumber(io.read())
        if removeIndex and removeIndex >= 1 and removeIndex <= #list then
            table.remove(list, removeIndex)
            print("Entry removed. Current database entries:")
            for i, v in ipairs(list) do
                print(i, v)
            end
        else
            print("Invalid number. No entry removed.")
        end
    elseif input == "SORT" then
        table.sort(list)
        print("Sorted database entries:")
        for i, v in ipairs(list) do
            print(i, v)
        end
    else
        table.insert(list, input)
        print("Current database entries:")
        for i, v in ipairs(list) do
            print(i, v)
        end
    end
end

print("Final databse:")
local sortedList = {}
for i, v in ipairs(list) do
    table.insert(sortedList, v)
end
table.sort(sortedList)
for i, v in ipairs(sortedList) do
    print(i, v)
end

-- 1st iteration: currently database either prints input or exits after end is typed
-- 2nd iteration: added a check for empty input and a command to save and display the current database entries without exiting.
-- 3rd iteration: added a command to remove entries by its number
-- 4th iteration: put the sort fuction into the actual while loop as a command