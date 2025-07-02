//Named parameters are parameters you define using curly braces {} in a function. When calling the function,
// you specify each argument by name (label), not by position. This improves readability and flexibilit

void createAccount({String username = 'user', role = 'developer'}){
    print('Account with username: $username and role $role created successfully!');

}

void login({required String email, required String password}){
    print('user with Email :$email and Password: $password logged in successfully!');
    
}

void main(){
    createAccount();
    createAccount(username: 'Devcent', role: 'Graphic Designer');

    login(email:'devcent@gmail.com', password: '123456');
}