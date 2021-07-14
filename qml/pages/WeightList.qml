import QtQuick 2.0

Item
{
    property alias model: weightModel

    function addWeightRecord(date, weight)
    {
        var pos = findRecord(date);
        if (weight === "")
            weight = 0;
        if (pos === -1)
        {
            weightModel.append({
                                   date: date,
                                   weight: parseInt(weight, 10),
                                   ind: weightModel.count
                               });
        }
        else updateRecord(pos, date, weight);
        if (date === "")
            delRecord(dairyModel.count);
    }

    function findRecord(date)
    {
        for (var i = 0; i < weightModel.count; i++)
        {
            if (weightModel.get(i).date === date) {
                return i;
            }
        }
        return -1
    }

    //найти элемент с полем date, номер которого отличен от ind
    function findAnother(date, ind)
    {
        for (var i = 0; i < weightModel.count; i++)
        {
            if (weightModel.get(i).date === date && i !== ind) {
                return i;
            }
        }
        return -1
    }

    function updateRecord(ind, date, weight)
    {
        var pos = findAnother(date,ind)
        weightModel.get(ind).date = date
        weightModel.get(ind).weight = parseInt(weight, 10)
        if (pos !== -1) delRecord(pos)
    }

    function delRecord(ind)
    {
        if(weightModel.count!==0)
        {
            for (var i = ind; i < weightModel.count - 1; i++)
            {
                weightModel.get(i).date = weightModel.get(i + 1).date;
                weightModel.get(i).weight = weightModel.get(i + 1).weight;
                weightModel.get(i).ind = weightModel.get(i + 1).ind;
            }
            weightModel.remove(weightModel.count - 1)
        }
    }

    ListModel
    {
        id: weightModel
        ListElement
        {
            date: "25.04.2021"
            weight: 75
            ind: 0
        }
    }
}
