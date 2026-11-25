import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/venue.dart';


void main(){
  group('Venue', (){
    test('deve gerar um ID automaticamente quando não receber um.', (){
      final venue = Venue(name: 'Campo do São roque', address: 'São roque', latitude: 20, longitude: 30);
      expect(venue.id, isNotEmpty);
    });


    test('dever ter o mesmo UUID que antes', (){
      final venue = Venue(id:'venue-123', name: 'Campo do São roque', address:'São roque', latitude: 20, longitude: 30);
      expect(venue.id, 'venue-123');
    });


     test('dever inicializar os atributos corretamente', (){
      final venue = Venue(name: 'Arena Gol de Placa', address:'Paraty - RJ', latitude:-23.217, longitude:-44.713);
      expect(venue.name, 'Arena Gol de Placa');
      expect(venue.address, 'Paraty - RJ');
      expect(venue.latitude, -23.217);
      expect(venue.longitude, -44.713 );
    });


    test('deve permitir placeId nulo', (){
      final venue = Venue(name: 'Arena Gol de Placa', address:'Paraty - RJ', latitude:-23.217, longitude:-44.713);
      expect(venue.placeId, isNull);
      
    });


    test('deve preservar o placeId informado', (){
      final venue = Venue(name: 'Arena Gol de Placa', address:'Paraty - RJ', latitude:-23.217, longitude:-44.713, placeId:'google-place-123' );
      expect(venue.placeId,'google-place-123');
      
    });
  });

  test('deve rejeitar latitude maior que 90', () {
  expect(
    () => Venue(
      name: 'Arena Gol de Placa',
      address: 'Paraty - RJ',
      latitude: 91,
      longitude: -44.713,
    ),
    throwsArgumentError,
  );
});

test('deve rejeitar latitude menor que -90', () {
  expect(
    () => Venue(
      name: 'Arena Gol de Placa',
      address: 'Paraty - RJ',
      latitude: -91,
      longitude: -44.713,
    ),
    throwsArgumentError,
  );
});

test('deve rejeitar longitude maior que 180', () {
  expect(
    () => Venue(
      name: 'Arena Gol de Placa',
      address: 'Paraty - RJ',
      latitude: -23.217,
      longitude: 181,
    ),
    throwsArgumentError,
  );
});
}