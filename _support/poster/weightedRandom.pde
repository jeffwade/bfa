//limit: normally width or height
//parts: number of partitions
//focus: weighted portion

//should extend to be able to pick number of parts and focus
//for now there will be five parts and it will be center weighted
float weightedRandomX(float limit, int parts, int focus) {
  int p = floor(random(3));
  float result;
  switch (p) {
    case 0 :
      result = random((2*limit/parts), (3*limit/parts));
      break;  
    case 1 :
      result = random((1*limit/parts), (4*limit/parts));
      break;  
    case 2 :
      result = random(0, limit);
      break;  
    default :
      result = 100;
    break;  
  }

  return result;
}

float weightedRandomY(float limit, int parts, int focus) {
  int p = floor(random(3));
  float result;
  switch (p) {
    case 0 :
      result = random((4*limit/parts), limit);
      break;  
    case 1 :
      result = random((2*limit/parts), limit);
      break;  
    case 2 :
      result = random(0, limit);
      break;  
    default :
      result = 100;
    break;  
  }

  return result;
}