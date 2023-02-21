class StaticData {
  static List<String> foodImageReferences = [
    'assets/images/string_hoppers.png',
    'assets/images/kottu.png',
    'assets/images/prawn_curry.png',
    'assets/images/gotukola.png',
    'assets/images/kiribath.jpg',
    'assets/images/pol_rotti.jpg',
    'assets/images/wambatu_moju.jpg',
  ];

  static List<String> foodNames = [
    'Beetroot Curry',
    'Dhal Curry',
    'Fish Ambul Thiyal',
    'Gotukola Sambol',
    'Kiribath',
    'Kottu',
    'Pittu',
    'Pol Rotti',
    'Pol Sambol',
    'Wambatu Moju'
  ];

  static Map<String, String> ingredients = {
    'Kottu':
        'Wheat flour,Salt,Carrot,Leeks,Onion,Ginger,Garlic,Chili Powder,Chili flakes,Pepper,Chicken,Cheese,Beef,Prawns,Tumeric',
    'Gotukola Sambol': 'Gotukola,Onion,Green Chilie,Lime,Salt',
    'Beetroot Curry':
        'Beetroot, onion, garlic,curry leaves,pandan,green chili,coconut,fenugreek seeds,turmeric,chili powder,curry powder,salt',
    'Pittu': 'Coconut, rice flour, salt',
    'Pol Rotti': 'wheat flour, coconut, salt',
    'Fish Ambul Thiyal':
        'Fish, Goraka (garcinia cambogia), pepper,salt, chili powder, curry leaves, cinnamon',
    'Dhal Curry':
        'red lentils, onion, garlic, curry leaves, pandan, green chili, coconut milk, salt, curry powder, tumeric powder, chili powder',
    'Wambatu Moju':
        'Eggplant/brinjal, oil, onion, chili, ginger, garlic, turmeric, chili powder, mustard, salt, vinegar, sugar',
    'Pol Sambol':
        'Coconut, onion, dried chili flakes, chili powder, salt, lime',
    'Kiribath': 'White raw rice, Salt, Coconut milk',
  };

  static Map<String, String> allergyTriggers = {
    'Kottu': 'Fish,Crustacean,Shellfish,Wheat,Soy',
    'Fish Ambul Thiyal': 'fish',
    'Pol Rotti': 'Wheat',
    'Pol Sambol': 'Fish',
    'Gotukola Sambol': 'None',
    'Beetroot Curry': 'None',
    'Dhal Curry': 'None',
    'Pittu': 'None',
    'Wambatu Moju': 'None',
    'Kiribath': 'None'
  };

  static Map<String, String> optionalIngredients = {
    'Dhal Curry': 'mustard seeds, oil, cumin seeds, cinnamon, chili flakes',
    'Gotukola Sambol': 'tomato, maldive fish',
    'Beetroot Curry': 'oil',
    'Pol Rotti': 'onion, green chili, curry leaves',
    'Pittu': 'None',
    'Fish Ambul Thiyal': 'garlic, pandan, curry powder, cardamom',
    'Kottu':
        'Eggs, chicken, beef, pork, eggs, fish, prawns, sausage, cheese, dhal, cabbage, capsicum, green onions, tomato, coconut, curry powder, cinnamon, tamarind, soy sauce, tomato sauce',
    'Wambatu Moju': 'Tamarind, soy sauce, sprats',
    'Pol Sambol': 'maldive fish, pepper',
    'Kiribath': 'None'
  };

  static Map<String, String> notSuitableFor = {
    'Kottu':
        'Gluten-free diets,Keto diets,Paleo diets,Diabetic-Friendly diets,Low carb and fat diets,Low porcessed food diets',
    'Beetroot Curry': 'keto,Low fat',
    'Dhal Curry': 'keto,Paleo,Low carb,Low fat',
    'Fish Ambul Thiyal': 'None',
    'Gotukola Sambol': 'Low fat',
    'Kiribath': 'keto,Low fat',
    'Pittu': 'keto,Paleo,diabetes friendly,Low carb,Low fat',
    'Pol Rotti': 'None',
    'Pol Sambol': 'Low fat',
    'Wambatu Moju':
        'diabetes friendly,Low carb,Low fat,Low processed sugar,Low processed food'
  };

  static Map<String, String> imageReferences = {
    'Kottu': 'assets/images/kottu.png',
    'Gotukola Sambol': 'assets/images/gotukola.png',
    'Kiribath': 'assets/images/kiribath.jpg',
    'Pol Rotti': 'assets/images/pol_rotti.jpg',
    'Wambatu Moju': 'assets/images/wambatu_moju.jpg',
    'Fish Ambul Thiyal': 'assets/images/fish_ambulthiyal.jpg',
    'Dhal Curry': 'assets/images/dhal_curry.jpg',
    'Beetroot Curry': 'assets/images/beetroot_curry.jpg',
    'Pittu': 'assets/images/pittu.jpg',
    'Pol Sambol': 'assets/images/pol_sambol.jpg'
  };

  static List<String> getIngredientsList(String foodName) {
    print('Retrieving ingredients');
    List<String> ingredientsList = ingredients[foodName]!.split(',');
    for (var element in ingredientsList) {
      element.trim();
    }
    return ingredientsList;
  }

  static List<String> getAllergyTriggersList(String foodName) {
    print('Retrieving allergy trigger');

    List<String> allergyTriggerList = allergyTriggers[foodName]!.split(',');
    for (var allergyTigger in allergyTriggerList) {
      allergyTigger.trim();
    }
    return allergyTriggerList;
  }

  static List<String> getNotStuitableFor(String foodName) {
    print('Retrieving not suitable for');

    List<String> notSuitableForList = notSuitableFor[foodName]!.split(',');
    for (var notSuitableFor in notSuitableForList) {
      notSuitableFor.trim();
    }
    return notSuitableForList;
  }

  static String getImageReferenceForFood(String foodName) {
    print('Retrieving image reference');
    return imageReferences[foodName]!;
  }

  static List<String> getOptionalIngredients(String foodName) {
    print('Retrieving optional ingredients');
    List<String> optionalIngredientsList =
        optionalIngredients[foodName]!.split(',');
    for (var element in optionalIngredientsList) {
      element.trim();
    }
    return optionalIngredientsList;
  }

  static List<String> dietPreferencesPartOne = [
    'Omnivore',
    'Carnivore',
    'Pescetarian',
    'Vegetarian',
    'Vegan',
    'Flexitarian',
    'Gluten-free',
    'Dairy-free',
    'Keto',
    'Paleo',
    'Diabetes friendly',
    'Low Carb',
    'Low fat',
    'Low processed sugar',
    'Low processed food',
    'Test 1',
    'Test 2',
    'Test 3',
    'Test 4',
    'Test 5',
    'Test 6',
    'Test 7',
    'Test 8',
    'Test 9',
    'Test 10',
    'Test 11',
    'Test 12',
    'Test 13',
    'Test 14',
    'Test 15',
    'Test 16',
    'Test 17',
    'Test 18',

  ];

  static List<String> dietPreferencesPartTwo = [
    'Lactose Intolerance',
    'Gluten Intolerance',
    'Diabetic',
    'Egg Intolerance',
    'Nut Intolerance',
    'Fish Intolerance',
    'Crustacean Intolerance',
    'Shellfish Intolerance',
    'Soy Intolerance',
    'Sesame Intolerance'
  ];
}
