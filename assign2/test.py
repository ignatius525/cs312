int a = 2;
int f (int y) {
 static int z = -2;
 // A
 if (!y) {
 y++;
 a = f(y + 1);
 }
 z += 1;
 // B
 return z;
}
void main () {
 int x = 5;
 int y = 7;
 int z = 0;
 // C
 x = f(z);
 // D
 y = f(a);
 // E
}
