// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Character {

 int? get id; String? get name; String? get status; String? get species; String? get type; String? get gender; CharacterLocation? get origin; CharacterLocation? get location; String? get image; List<String>? get episode; String? get url; DateTime? get created;
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterCopyWith<Character> get copyWith => _$CharacterCopyWithImpl<Character>(this as Character, _$identity);

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.episode, episode)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(episode),url,created);

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
}


}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res>  {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) = _$CharacterCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? status, String? species, String? type, String? gender, CharacterLocation? origin, CharacterLocation? location, String? image, List<String>? episode, String? url, DateTime? created
});




}
/// @nodoc
class _$CharacterCopyWithImpl<$Res>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? type = freezed,Object? gender = freezed,Object? origin = freezed,Object? location = freezed,Object? image = freezed,Object? episode = freezed,Object? url = freezed,Object? created = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,origin: freezed == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterLocation?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterLocation?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Character implements Character {
  const _Character({this.id, this.name, this.status, this.species, this.type, this.gender, this.origin, this.location, this.image, final  List<String>? episode, this.url, this.created}): _episode = episode;
  factory _Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? status;
@override final  String? species;
@override final  String? type;
@override final  String? gender;
@override final  CharacterLocation? origin;
@override final  CharacterLocation? location;
@override final  String? image;
 final  List<String>? _episode;
@override List<String>? get episode {
  final value = _episode;
  if (value == null) return null;
  if (_episode is EqualUnmodifiableListView) return _episode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? url;
@override final  DateTime? created;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterCopyWith<_Character> get copyWith => __$CharacterCopyWithImpl<_Character>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._episode, _episode)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(_episode),url,created);

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
}


}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(_Character value, $Res Function(_Character) _then) = __$CharacterCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? status, String? species, String? type, String? gender, CharacterLocation? origin, CharacterLocation? location, String? image, List<String>? episode, String? url, DateTime? created
});




}
/// @nodoc
class __$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? type = freezed,Object? gender = freezed,Object? origin = freezed,Object? location = freezed,Object? image = freezed,Object? episode = freezed,Object? url = freezed,Object? created = freezed,}) {
  return _then(_Character(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,origin: freezed == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterLocation?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterLocation?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self._episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
