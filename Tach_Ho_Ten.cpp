#include <iostream>
#include <string>
using namespace std;

int main(){
    string FullName, FirstName, LastName, MiddleName;
    int vt_first_name;

    cout << "Enter your fullname: ";
    getline(cin, FullName);

    // Find FirtName
    for(int i=0; i<FullName.size(); i++)
    if(FullName[i]==' '){
        vt_first_name = i;
        break;
    }
    FirstName = FullName.substr(0, vt_first_name);

    //Find LastName
    int j = FullName.size()-1;
    while(FullName[j]!=' '){
        LastName = FullName[j]+LastName;
        j--;
    }
    /* Calculator MiddleName */
    if(FirstName.size()+LastName.size()+1 == FullName.size())
        MiddleName = "";
    else MiddleName = FullName.substr(vt_first_name+1, FullName.size() - ((LastName.size()+1)+vt_first_name+1));

    cout << "FullName\t: " << FullName << endl;
    cout << "FirstName\t: " << FirstName << endl;
    cout << "MiddleName\t: " << MiddleName << endl;
    cout << "LastName\t: " << LastName << endl;
}
