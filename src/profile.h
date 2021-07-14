#ifndef PROFILE_H
#define PROFILE_H
#include <QString>

class Profile
{
public:
    Profile( QString name, QString surname,int weight,int age,int heigth);

    QString get_name(){return _name;};
    QString get_surname(){return _surname;};
    int get_weight(){return _weight;};
    int get_age(){return _age;};
    int get_heigth(){return _heigth;};

    void set_name(QString name){_name=name;};
    void set_surname(QString surname){_surname=surname;};
    void set_age(int age){_age=age;};

private:
    QString _name, _surname;
    int _weight;
    int _age;
    int _heigth;

};

#endif // PROFILE_H
