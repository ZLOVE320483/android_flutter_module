
void main() {
  B b = B();
  b.a();
}

class A {

  void _a() {
    print('---a---');
  }
}

class A1 {

  void a() {
    print('---a1---');
  }
}

class C {
  void c() {
    print('---c---');
  }
}

class B with A {

  void a() {
    print('---b---');
    super._a();
}

}