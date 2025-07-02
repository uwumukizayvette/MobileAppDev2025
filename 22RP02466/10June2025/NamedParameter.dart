void greet({String? name, int age = 18}) {
  print('Hello $name, you are $age years old.');
}
void main(){
    greet(name: 'Alice', age: 25); 
greet(age: 30);                 
greet();                       

}