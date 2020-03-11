require 'csv'

data = CSV.read('words.csv')
res = []
data.each_with_index do |row, ind|
    next if ind == 0

    tmp = {}
    tmp_arr = []
    main_word = ""
    row.each_with_index do |h, index|
        if index == 0
            main_word = h
            next
        end
        tmp_arr << h
    end

    res << {"HYPONYM" => main_word, "HYPERONYM" => tmp_arr.join(", ")}
end

CSV.open("words_2.csv", "wb") do |csv|
    csv << res[0].keys()

    res.each do |hash|
        csv << [hash["HYPONYM"], hash["HYPERONYM"]]
    end
end