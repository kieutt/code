#include<iostream>
#include<cstdio>
#include<algorithm>

using namespace std;

int mmax(int a, int b, int c){
    return max(a, max(b, c));
}

int main(){
    int Arr[101][101];
    int Arr_Table[101][101];
    int coll, row;
    int i, j;
    int MAX = Arr[row-1][0];

    freopen("arr.inp","r",stdin);
    freopen("arr.out","w",stdout);
    cin >> row >> coll;
    for(i=0; i<row; i++)
        for(j=0; j<coll; j++)
        cin >> Arr[i][j];
    for(j=0; j<coll; j++)
        Arr_Table[0][j] = Arr[0][j];

    for(i=1; i<row; i++)
        for(j=0; j<coll; j++)
            Arr_Table[i][j] = mmax(Arr_Table[i-1][j]+Arr[i][j-1], Arr_Table[i-1][j]+Arr[i][j],Arr_Table[i-1][j]+Arr[i][j+1]);

    for(j=1; j<coll; j++)
        if(Arr_Table[row-1][j] > MAX)
            MAX = Arr_Table[row-1][j];
    cout << MAX;
}
