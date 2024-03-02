#include<iostream>
#include<list>
#include<string>
#include<iomanip>
#include<Windows.h>
using namespace std;
struct BOOK
{
    int NumberUDK = 0, KOLVOEKZ = 0, DATA = 0;
    string AUTOR = "none", NAMEBOOK = "none";
};
void vozmoshnosi()
{
    cout << "Для добавления книги в конец введите 1." << endl;
    cout << "Для добавления книги перед указанной книгой введите 2, после указанной 3." << endl;
    cout << "Для добавления книги отсортированной по автору введите 4." << endl;
    cout << "Для удаления выбранной книги введите 5." << endl;
    cout << "Для вывода информации о книгах введите 6." << endl;
    cout << "Для взятия книги введите 7, для возврата книги введите 8." << endl;
    cout << "Для выхода из программы введите 0." << endl;
}
void vvoddannix(BOOK& data)
{
    cout << "Введите номер UDK: ";
    cin >> data.NumberUDK;
    cin.ignore();
    cout << "Введите Фамилию и инициалы автора: ";
    getline(cin, data.AUTOR);
    cout << "Введите название книги: ";
    getline(cin, data.NAMEBOOK);
    cout << "Введите год издания книги: ";
    cin >> data.DATA;
    cout << "Введите количество экземпляров книги: ";
    cin >> data.KOLVOEKZ;
    cin.ignore();
}
int main() {
    setlocale(LC_ALL, "Russian");
    SetConsoleCP(1251);
    list<BOOK> LIST;
    int number = 0;
    do
    {
        BOOK bookdan;
        vozmoshnosi();
        cout << "Ваш выбор: ";
        cin >> number;
        cin.ignore();
        switch (number)
        {
        case 1:
        {
            vvoddannix(bookdan);
            LIST.push_back(bookdan);
            break;
        }
        case 2:
        {
            int index;
            cout << "Введите номер книги перед которой хотите вставить: ";
            cin >> index;
            if (index<0 or index>LIST.size())
                cout << "неверно указаны данные!" << endl;
            else
            {
                vvoddannix(bookdan);
                auto it = LIST.begin();
                advance(it, index);
                LIST.insert(it, bookdan);
            }
            break;
        }
        case 3:
        {
            int index;
            cout << "Введите номер книги после которой хотите вставить: ";
            cin >> index;
            if (index<0 or index>LIST.size())
                cout << "неверно указаны данные!" << endl;
            else
            {
                vvoddannix(bookdan);
                auto it = LIST.begin();
                advance(it, index + 1);
                LIST.insert(it, bookdan);
            }
            break;
        }
        case 4:
        {
            vvoddannix(bookdan);
            for (auto it = LIST.begin(); it != LIST.end(); it++)
            {
                if (bookdan.AUTOR < it->AUTOR)
                {
                    LIST.insert(it, bookdan);
                    break;
                }
            }
            break;
        }
        case 5:
        {
            int index;
            cout << "Введите номер книги, которую хотите удалить: ";
            cin >> index;
            cin.ignore();
            auto it = LIST.begin();
            advance(it, index);
            LIST.erase(it);
            break;
        }
        case 6:
        {
            if (LIST.empty())
            {
                cout << "Библиотека пуста" << endl;
            }
            else
            {
                cout << "--------------------------------------------------------------------------------------------------" << endl;
                cout << "|" << setw(5) << left << "№" << "|" << setw(10) << left << "Номер UDK" << "|" << setw(25) << left << "Фамилия инициалы автора" << "|" << setw(30) << left << "Название книги" << "|" << setw(10) << left
                    << "Год издания" << "|" << setw(10) << left << "Количество" << "|" << endl;
                cout << "--------------------------------------------------------------------------------------------------" << endl;
                int i = 0;
                for (auto it = LIST.begin(); it != LIST.end(); it++)
                {
                    cout << "|" << setw(5) << left << i;
                    cout << "|" << setw(10) << left << it->NumberUDK;
                    cout << "|" << setw(25) << left << it->AUTOR;
                    cout << "|" << setw(30) << left << it->NAMEBOOK;
                    cout << "|" << setw(11) << left << it->DATA;
                    cout << "|" << setw(10) << left << it->KOLVOEKZ << "|" << endl;
                    cout << "--------------------------------------------------------------------------------------------------" << endl;
                    i++;
                }
            }
            break;
        }
        case 7:
        {
            int UDK;
            cout << "Введите номер UDK: ";
            cin >> UDK;
            cin.ignore();
            bool p = true;
            for (auto it = LIST.begin(); it != LIST.end(); it++)
            {
                if (it->NumberUDK == UDK)
                {
                    if (it->KOLVOEKZ > 0)
                    {
                        cout << "Книга успешно выдана" << endl;
                        it->KOLVOEKZ--;
                    }
                    else
                    {
                        cout << "Данная книга отсутствует." << endl;
                    }
                    p = false;
                    break;
                }
            }
            if (p == true)
            {
                cout << "Неверный номер UDK" << endl;
            }
            break;
        }
        case 8:
        {
            int UDK;
            cout << "Введите номер UDK: ";
            cin >> UDK;
            cin.ignore();
            bool p = true;
            for (auto it = LIST.begin(); it != LIST.end(); it++)
            {
                if (it->NumberUDK == UDK)
                {
                    cout << "Книга успешно возвращена" << endl;
                    it->KOLVOEKZ++;
                    p = false;
                    break;
                }
            }
            if (p == true)
            {
                cout << "Неверный номер UDK" << endl;
            }
            break;
        }
        case 0:
            break;
        default:
            cout << "Неверно введенные данные!" << endl;
            break;
        }
    } while (number != 0);
    return 0;
}
