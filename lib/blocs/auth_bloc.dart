import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // For development, we'll use mock authentication instead of Firebase
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthBloc() : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    // For development, we'll always return unauthenticated
    emit(AuthUnauthenticated());
  }

  Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Mock successful login for development
      await Future.delayed(const Duration(seconds: 1));
      
      if (event.email == 'test@example.com' && event.password == 'password') {
        emit(AuthAuthenticated(
          uid: '123456',
          name: 'Test User',
          email: event.email,
        ));
      } else {
        emit(AuthFailure('Туура эмес email же сырсөз'));
      }
    } catch (e) {
      emit(AuthFailure('Кирүү учурунда ката кетти: $e'));
    }
  }

  Future<void> _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Mock successful registration for development
      await Future.delayed(const Duration(seconds: 1));
      
      emit(AuthAuthenticated(
        uid: '123456',
        name: event.name,
        email: event.email,
      ));
    } catch (e) {
      emit(AuthFailure('Катталуу учурунда ката кетти: $e'));
    }
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Mock logout for development
      await Future.delayed(const Duration(milliseconds: 500));
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthFailure('Чыгуу учурунда ката кетти: $e'));
    }
  }
}
