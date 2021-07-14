import QtQuick 2.0

Item
{
    property alias model: dairyModel

    function addDairyRecord(date, text)
    {
        dairyModel.append({

                              date: date,
                              training: text,
                              index_d: date[0] + date[1],
                              index_m: date[3] + date[4],
                              index_y: date[6] + date[7] + date[8] + date[9],
                              ind: dairyModel.count
                          });
        if (date === "")
            delRecord(dairyModel.count);
    }

    function findRecord(date)
    {
        for (var i = 0; i < dairyModel.count; i++)
        {
            if (dairyModel.get(i).date === date)
            {
                return i;
            }
        }
        return -1
    }

    function updateRecord(ind, date, training)
    {
        dairyModel.get(ind).date = date;
        dairyModel.get(ind).training = training;
    }

    function delRecord(ind)
    {
        if(dairyModel.count !== 0)
        {
            for (var i = ind; i < dairyModel.count - 1; i++)
            {
                dairyModel.get(i).date = dairyModel.get(i + 1).date;
                dairyModel.get(i).training = dairyModel.get(i + 1).training;
                dairyModel.get(i).ind = dairyModel.get(i + 1).ind;
            }
            dairyModel.remove(dairyModel.count - 1)
        }
    }

    function getRecordsByMonth(month, year)
    {
        array = [];
        for(var i = 0; i < dairyModel.count; i++)
        {
            if(dairyModel.get(i).index_y === year && dairyModel.get(i).index_m === month)
            {
                result = [array, dairyModel.get(i)];
                array = result;
            }

        }
        return array;
    }

    function getRecordsByYear(year)
    {
        array = [];
        for(var i = 0; i < dairyModel.count; i++)
        {
            if(dairyModel.get(i).index_y === year)
            {
                result = [array, dairyModel.get(i)];
                array = result;
            }

        }
        return array;
    }

    function getRecordsByDate(date, month, year)
    {
        array = [];
        for(var i = 0; i < dairyModel.count; i++)
        {
            if(dairyModel.get(i).index_y === year && dairyModel.get(i).index_m === month
                    && dairyModel.get(i).index_d === date)
            {
                result = [array, dairyModel.get(i)];
                array = result;
            }

        }
        return array;
    }

    ListModel
    {
        id: dairyModel
        ListElement
        {
            date: "25.04.2021"
            training: "Приседания - 30"
            index_d: 25
            index_m: 04
            index_y: 2021
            ind: 0
        }

    }

}
