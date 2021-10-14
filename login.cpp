#include<iostream>
#include<fstream>
#include<string>
using namespace std;

void login_validation(){
  string user_verif, pass_verif, username, password;
  cout << "Enter Username:" << endl;
  cin >> username;
  cout << "Enter Password:" << endl;
  cin >> password;
  ifstream existing_account(username + ".txt");
  getline(existing_account, user_verif);
  getline(existing_account, pass_verif);
  if(user_verif == username && pass_verif == password){
      cout << "You are successfully logged in !!!" << endl;
    }
  else{
      cerr << "These login credentials are incorrect" << endl;
  }

}
void registration(string new_username, string new_password){
  string filename;
  filename = new_username + ".txt";
  ofstream newAccount;
  newAccount.open(filename);
  newAccount << new_username << endl << new_password;
  newAccount.close();
}

int main(){
  string answer;
  cout << "Are you a returning user? Enter Y for yes or N for no" << endl;
  cin >> answer;
  if(answer == "Y"){
    login_validation();
  }
  if(answer == "N"){
    string new_username, new_password;
    cout << "Create a username" << endl;
    cin >> new_username;
    cout << "Create a password" << endl;
    cin >> new_password;
    registration(new_username, new_password);
  }

return 0;


}
