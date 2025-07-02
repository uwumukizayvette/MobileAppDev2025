class User {
  String? name;
  String? email;

User(this.name,this.email);
}

void main(){
  User user1 = User('Samuel','samuel@example.com');
   print('Name: ${user1.name}');
}


