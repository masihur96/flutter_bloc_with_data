class AuthRepository {
  Future<void> login(String username, String password) async {
    // Simulate API call for login
    await Future.delayed(const Duration(seconds: 2));
    if (username == 'user' && password == 'password') {
      // Successful login
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> logout() async {
    // Simulate logout
    await Future.delayed(Duration(seconds: 1));
  }
}
