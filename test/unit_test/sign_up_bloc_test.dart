import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_identificator/src/core/errors/failures.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/entities/user.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/repositories/user_repository.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';


class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late SignUpBloc signUpBloc;
  late UserRepository mockUserRepository;


  setUp(() {
    mockUserRepository = MockUserRepository();
    signUpBloc = SignUpBloc(userRepository: mockUserRepository);
  });

  tearDown(() {
    signUpBloc.close();
  });

  group('SignUpBloc', () {
    const user = User(email: 'test@example.com', password: 'password');

    blocTest<SignUpBloc, SignUpState>(
      'emits [SignUpLoading, SignUpSuccess] when SignUpButtonPressed is added successfully',
      build: () {
        when(() => mockUserRepository.registerUser(any(), any()))
            .thenAnswer((_) async => const Right(user));

        return signUpBloc;
      },
      act: (bloc) => bloc.add(const SignUpButtonPressed(email: 'test@example.com', password: 'password')),
      expect: () => [
        SignUpLoading(),
       const SignUpSuccess(email: 'test@example.com', password: 'password'),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [SignUpLoading, SignUpError] when SignUpButtonPressed fails',
      build: () {
        when(() => mockUserRepository.registerUser(any(), any()))
            .thenAnswer((_) async =>const Left(YourSpecificFailure(message: 'Registration failed')));

        return signUpBloc;
      },
      act: (bloc) => bloc.add(const SignUpButtonPressed(email: 'test@example.com', password: 'password')),
      expect: () {
        final expectedStates = [
          SignUpLoading(),
          SignUpError(message: '${const YourSpecificFailure( message: 'Registration failed')}') 
        ];
        return equals(expectedStates);
      }
    );

   blocTest<SignUpBloc, SignUpState>(
  'emits [SignUpLoading, SignUpError] when an exception occurs during registration',
  build: () {
    when(() =>  mockUserRepository.registerUser(any(), any())).thenThrow('Some error');
    return signUpBloc;
  },
  act: (bloc) => bloc.add(const SignUpButtonPressed(email: 'test@example.com', password: 'password')),
  expect: () {
    final expectedStates = [
      SignUpLoading(),
      const  SignUpError(message: 'Some error'),
    ];
    return equals(expectedStates);
  },
);
  });
}
