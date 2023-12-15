enum BloodGroup {
  A_POSITIVE,
  A_NEGATIVE,
  B_POSITIVE,
  B_NEGATIVE,
  O_POSITIVE,
  O_NEGATIVE,
  AB_POSITIVE,
  AB_NEGATIVE
}

Map<BloodGroup, String> bgToString = {
  BloodGroup.A_POSITIVE: 'A+',
  BloodGroup.A_NEGATIVE: 'A-',
  BloodGroup.B_POSITIVE: 'B+',
  BloodGroup.B_NEGATIVE: 'B-',
  BloodGroup.O_POSITIVE: 'O+',
  BloodGroup.O_NEGATIVE: 'O-',
  BloodGroup.AB_POSITIVE: 'AB+',
  BloodGroup.AB_NEGATIVE: 'AB-',
};

Map<String, BloodGroup> sTringToBg = {
  'A+': BloodGroup.A_POSITIVE,
  'A-': BloodGroup.A_NEGATIVE,
  'B+': BloodGroup.B_POSITIVE,
  'B-': BloodGroup.B_NEGATIVE,
  'O+': BloodGroup.O_POSITIVE,
  'O-': BloodGroup.O_NEGATIVE,
  'AB+': BloodGroup.AB_POSITIVE,
  'AB-': BloodGroup.AB_NEGATIVE,
};
